Machine Learning in Molecular Sciences
==================================================

.. image:: https://s1.ax1x.com/2020/07/21/UosEmd.md.jpg

* **Aims**:
The NYU-ECNU Center for Computational Chemistry at `New York University Shanghai <https://shanghai.nyu.edu/>`_ (a.k.a, NYU Shanghai) announced a summer school dedicated to machine learning and its applications in the molecular sciences to be held June, 2017 at the NYU Shanghai Pudong Campus. Using a combination of technical lectures and hands-on exercises, the school aimed to instruct attendees in both the fundamentals of modern machine learning techniques and to demonstrate how these approaches can be applied to solve complex computational problems in chemistry, biology, and materials science. In order to promote the idea of free to code, this project is built to help you understand some basic machine learning models mentioned below.

.. raw:: html
   
   <!doctype html>
   <html>
   <head>
   <meta charset="utf-8">
   <title>首页</title>
   
   <style>
   html,body{
   	margin:0px;
   	width:100%;
   	height:100%;
   	overflow:hidden;
     background:#000;
   }
   
   #canvas{
   	position:absolute;
   	width:100%;
   	height:100%;
   }
   </style>
   
   </head>
   <body>
   
   <canvas id="canvas"></canvas>
   
   <script>
   function project3D(x,y,z,vars){
   
   	var p,d;
   	x-=vars.camX;
   	y-=vars.camY-8;
   	z-=vars.camZ;
   	p=Math.atan2(x,z);
   	d=Math.sqrt(x*x+z*z);
   	x=Math.sin(p-vars.yaw)*d;
   	z=Math.cos(p-vars.yaw)*d;
   	p=Math.atan2(y,z);
   	d=Math.sqrt(y*y+z*z);
   	y=Math.sin(p-vars.pitch)*d;
   	z=Math.cos(p-vars.pitch)*d;
   	var rx1=-1000;
   	var ry1=1;
   	var rx2=1000;
   	var ry2=1;
   	var rx3=0;
   	var ry3=0;
   	var rx4=x;
   	var ry4=z;
   	var uc=(ry4-ry3)*(rx2-rx1)-(rx4-rx3)*(ry2-ry1);
   	var ua=((rx4-rx3)*(ry1-ry3)-(ry4-ry3)*(rx1-rx3))/uc;
   	var ub=((rx2-rx1)*(ry1-ry3)-(ry2-ry1)*(rx1-rx3))/uc;
   	if(!z)z=0.000000001;
   	if(ua>0&&ua<1&&ub>0&&ub<1){
   		return {
   			x:vars.cx+(rx1+ua*(rx2-rx1))*vars.scale,
   			y:vars.cy+y/z*vars.scale,
   			d:(x*x+y*y+z*z)
   		};
   	}else{
   		return { d:-1 };
   	}
   }
   
   
   function elevation(x,y,z){
   
   	var dist = Math.sqrt(x*x+y*y+z*z);
   	if(dist && z/dist>=-1 && z/dist <=1) return Math.acos(z / dist);
   	return 0.00000001;
   }
   
   
   function rgb(col){
   
   	col += 0.000001;
   	var r = parseInt((0.5+Math.sin(col)*0.5)*16);
   	var g = parseInt((0.5+Math.cos(col)*0.5)*16);
   	var b = parseInt((0.5-Math.sin(col)*0.5)*16);
   	return "#"+r.toString(16)+g.toString(16)+b.toString(16);
   }
   
   
   function interpolateColors(RGB1,RGB2,degree){
   	
   	var w2=degree;
   	var w1=1-w2;
   	return [w1*RGB1[0]+w2*RGB2[0],w1*RGB1[1]+w2*RGB2[1],w1*RGB1[2]+w2*RGB2[2]];
   }
   
   
   function rgbArray(col){
   
   	col += 0.000001;
   	var r = parseInt((0.5+Math.sin(col)*0.5)*256);
   	var g = parseInt((0.5+Math.cos(col)*0.5)*256);
   	var b = parseInt((0.5-Math.sin(col)*0.5)*256);
   	return [r, g, b];
   }
   
   
   function colorString(arr){
   
   	var r = parseInt(arr[0]);
   	var g = parseInt(arr[1]);
   	var b = parseInt(arr[2]);
   	return "#"+("0" + r.toString(16) ).slice (-2)+("0" + g.toString(16) ).slice (-2)+("0" + b.toString(16) ).slice (-2);
   }
   
   
   function process(vars){
   
   
   	if(vars.points.length<vars.initParticles) for(var i=0;i<5;++i) spawnParticle(vars);
   	var p,d,t;
   	
   	p = Math.atan2(vars.camX, vars.camZ);
   	d = Math.sqrt(vars.camX * vars.camX + vars.camZ * vars.camZ);
   	d -= Math.sin(vars.frameNo / 80) / 25;
   	t = Math.cos(vars.frameNo / 300) / 165;
   	vars.camX = Math.sin(p + t) * d;
   	vars.camZ = Math.cos(p + t) * d;
   	vars.camY = -Math.sin(vars.frameNo / 220) * 15;
   	vars.yaw = Math.PI + p + t;
   	vars.pitch = elevation(vars.camX, vars.camZ, vars.camY) - Math.PI / 2;
   	
   	var t;
   	for(var i=0;i<vars.points.length;++i){
   		
   		x=vars.points[i].x;
   		y=vars.points[i].y;
   		z=vars.points[i].z;
   		d=Math.sqrt(x*x+z*z)/1.0075;
   		t=.1/(1+d*d/5);
   		p=Math.atan2(x,z)+t;
   		vars.points[i].x=Math.sin(p)*d;
   		vars.points[i].z=Math.cos(p)*d;
   		vars.points[i].y+=vars.points[i].vy*t*((Math.sqrt(vars.distributionRadius)-d)*2);
   		if(vars.points[i].y>vars.vortexHeight/2 || d<.25){
   			vars.points.splice(i,1);
   			spawnParticle(vars);
   		}
   	}
   }
   
   function drawFloor(vars){
   	
   	var x,y,z,d,point,a;
   	for (var i = -25; i <= 25; i += 1) {
   		for (var j = -25; j <= 25; j += 1) {
   			x = i*2;
   			z = j*2;
   			y = vars.floor;
   			d = Math.sqrt(x * x + z * z);
   			point = project3D(x, y-d*d/85, z, vars);
   			if (point.d != -1) {
   				size = 1 + 15000 / (1 + point.d);
   				a = 0.15 - Math.pow(d / 50, 4) * 0.15;
   				if (a > 0) {
   					vars.ctx.fillStyle = colorString(interpolateColors(rgbArray(d/26-vars.frameNo/40),[0,128,32],.5+Math.sin(d/6-vars.frameNo/8)/2));
   					vars.ctx.globalAlpha = a;
   					vars.ctx.fillRect(point.x-size/2,point.y-size/2,size,size);
   				}
   			}
   		}
   	}		
   	vars.ctx.fillStyle = "#82f";
   	for (var i = -25; i <= 25; i += 1) {
   		for (var j = -25; j <= 25; j += 1) {
   			x = i*2;
   			z = j*2;
   			y = -vars.floor;
   			d = Math.sqrt(x * x + z * z);
   			point = project3D(x, y+d*d/85, z, vars);
   			if (point.d != -1) {
   				size = 1 + 15000 / (1 + point.d);
   				a = 0.15 - Math.pow(d / 50, 4) * 0.15;
   				if (a > 0) {
   					vars.ctx.fillStyle = colorString(interpolateColors(rgbArray(-d/26-vars.frameNo/40),[32,0,128],.5+Math.sin(-d/6-vars.frameNo/8)/2));
   					vars.ctx.globalAlpha = a;
   					vars.ctx.fillRect(point.x-size/2,point.y-size/2,size,size);
   				}
   			}
   		}
   	}		
   }
   
   function sortFunction(a,b){
   	return b.dist-a.dist;
   }
   
   function draw(vars){
   
   	vars.ctx.globalAlpha=.15;
   	vars.ctx.fillStyle="#000";
   	vars.ctx.fillRect(0, 0, canvas.width, canvas.height);
   	
   	drawFloor(vars);
   	
   	var point,x,y,z,a;
   	for(var i=0;i<vars.points.length;++i){
   		x=vars.points[i].x;
   		y=vars.points[i].y;
   		z=vars.points[i].z;
   		point=project3D(x,y,z,vars);
   		if(point.d != -1){
   			vars.points[i].dist=point.d;
   			size=1+vars.points[i].radius/(1+point.d);
   			d=Math.abs(vars.points[i].y);
   			a = .8 - Math.pow(d / (vars.vortexHeight/2), 1000) * .8;
   			vars.ctx.globalAlpha=a>=0&&a<=1?a:0;
   			vars.ctx.fillStyle=rgb(vars.points[i].color);
   			if(point.x>-1&&point.x<vars.canvas.width&&point.y>-1&&point.y<vars.canvas.height)vars.ctx.fillRect(point.x-size/2,point.y-size/2,size,size);
   		}
   	}
   	vars.points.sort(sortFunction);
   }
   
   
   function spawnParticle(vars){
   
   	var p,ls;
   	pt={};
   	p=Math.PI*2*Math.random();
   	ls=Math.sqrt(Math.random()*vars.distributionRadius);
   	pt.x=Math.sin(p)*ls;
   	pt.y=-vars.vortexHeight/2;
   	pt.vy=vars.initV/20+Math.random()*vars.initV;
   	pt.z=Math.cos(p)*ls;
   	pt.radius=200+800*Math.random();
   	pt.color=pt.radius/1000+vars.frameNo/250;
   	vars.points.push(pt);	
   }
   
   function frame(vars) {
   
   	if(vars === undefined){
   		var vars={};
   		vars.canvas = document.querySelector("canvas");
   		vars.ctx = vars.canvas.getContext("2d");
   		vars.canvas.width = document.body.clientWidth;
   		vars.canvas.height = document.body.clientHeight;
   		window.addEventListener("resize", function(){
   			vars.canvas.width = document.body.clientWidth;
   			vars.canvas.height = document.body.clientHeight;
   			vars.cx=vars.canvas.width/2;
   			vars.cy=vars.canvas.height/2;
   		}, true);
   		vars.frameNo=0;
   
   		vars.camX = 0;
   		vars.camY = 0;
   		vars.camZ = -14;
   		vars.pitch = elevation(vars.camX, vars.camZ, vars.camY) - Math.PI / 2;
   		vars.yaw = 0;
   		vars.cx=vars.canvas.width/2;
   		vars.cy=vars.canvas.height/2;
   		vars.bounding=10;
   		vars.scale=500;
   		vars.floor=26.5;
   
   		vars.points=[];
   		vars.initParticles=700;
   		vars.initV=.01;
   		vars.distributionRadius=800;
   		vars.vortexHeight=25;
   	}
   
   	vars.frameNo++;
   	requestAnimationFrame(function() {
   		frame(vars);
   	});
   
   	process(vars);
   	draw(vars);
   }
   frame();
   </script>
   
   <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
   <p>适用浏览器：360、FireFox、Chrome、Opera、傲游、搜狗、世界之窗. 不支持Safari、IE8及以下浏览器。</p>
   <p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
   </div>
   </body>
   </html>
   

* **Topics**: 

Fundamental topics to be covered include basic machine learning models such as *kernel methods* and *neural networks optimization schemes*, *parameter learning* and *delta learning paradigms*, *clustering*, and *decision trees*.  Application areas will feature machine learning models for representing and predicting properties of individual molecules and condensed phases, learning algorithms for bypassing explicit quantum chemical and statistical mechanical calculations, and techniques applicable to biomolecular structure prediction, bioinformatics, protein-ligand binding, materials and molecular design and various others.

.. toctree::
    :maxdepth: 2
    :caption: Introduction to Machine Learning
    
    Introduction_to_Machine_Learning/index
    
.. toctree::
    :maxdepth: 2
    :caption: Kernel-based_Regression

.. toctree::
    :maxdepth: 2
    :caption: Dimensional_Reduction_Feature Selection_and_Clustering_techniques

.. toctree::
    :maxdepth: 2
    :caption: Introduction_to_Neural_Networks


.. toctree::
    :maxdepth: 2
    :caption: Practical_Session_Clustering_with_Feature_Selection_and_Validation


.. toctree::
    :maxdepth: 2
    :caption: Random_Forests

.. toctree::
    :maxdepth: 2
    :caption: Learning_Curves_Representations_and_Training_Sets


.. toctree::
    :maxdepth: 2
    :caption: Learning_Curves_Representations_and_Training_Sets


.. toctree::
    :maxdepth: 2
    :caption: Review_of_Electronic_Structure_Atomic_Molecular_and_Crystal_Representations

.. toctree::
    :maxdepth: 2
    :caption: Practical_Session_Learning_Curves

.. toctree::
    :maxdepth: 2
    :caption: Predicting_Properties_of_Molecules_and_Materials

.. toctree::
    :maxdepth: 2
    :caption: Parameter_Learning_and_Delta_Learning


.. toctree::
    :maxdepth: 2
    :caption: Learning_Electronic_Densities_and_ML_Models_of_Crystal_Properties

.. toctree::
    :maxdepth: 2
    :caption: Practical_Session_Machine_Learning_and_Property_Prediction

.. toctree::
    :maxdepth: 2
    :caption: Machine_Learning_of_Potential_Energy_Surfaces

.. toctree::
    :maxdepth: 2
    :caption: Machine_Learning_Based_Enhanced_Sampling

.. toctree::
    :maxdepth: 2
    :caption: Machine Learning of Free Energy Surfaces

.. toctree::
    :maxdepth: 2
    :caption: Cluster-based Analysis of Molecular Simulations

.. toctree::
    :maxdepth: 2
    :caption: Practical Session: Neural Network Learning of Free Energy Surfaces

.. toctree::
    :maxdepth: 2
    :caption: Development of Protein-ligand Scoring Functions

.. toctree::
    :maxdepth: 2
    :caption: Machine Learning in Structural Biology

.. toctree::
    :maxdepth: 2
    :caption: Practical Session: Random Forests and Scoring Functions

.. toctree::
    :maxdepth: 2
    :caption: Practical Session: Machine Learning for Structural Bioinformatics


External Links
===========================

* :ref:`genindex`
* :ref:`search`

.. automodule:: xgboost
    :members:
    :undoc-members:
    :show-inheritance:
    
.. literalinclude:: setup.py
