# %load outputfile.rst
.. raw:: html

   <div id="notebook" class="border-box-sizing" tabindex="-1">

.. raw:: html

   <div id="notebook-container" class="container">

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [1]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    import tensorflow.compat.v1 as tf
    import matplotlib.pyplot as plt
    import numpy as np
    from tensorflow.python.framework import ops
    ops.reset_default_graph()
    tf.disable_eager_execution()
    sess = tf.Session()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stderr output_text">

::

    /home/ma-user/anaconda3/envs/TensorFlow-2.1.0/lib/python3.6/site-packages/h5py/__init__.py:36: FutureWarning: Conversion of the second argument of issubdtype from `float` to `np.floating` is deprecated. In future, it will be treated as `np.float64 == np.dtype(float).type`.
      from ._conv import register_converters as _register_converters

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [2]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.relu([-3.,3.,10.])))
    y_relu = sess.run(tf.nn.relu(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [ 0.  3. 10.]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [3]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_relu, 'b:', label='ReLU', linewidth=2)
    plt.ylim([-5,11])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image0|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [4]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.relu6([-3.,3.,10.])))
    y_relu6 = sess.run(tf.nn.relu6(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [0. 3. 6.]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [6]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_relu6, 'g-.', label='ReLU6', linewidth=2)
    plt.ylim([-5,11])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image1|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [7]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.sigmoid([-1.,0.,1.])))
    y_sigmoid = sess.run(tf.nn.sigmoid(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [0.26894143 0.5        0.7310586 ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [8]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_sigmoid, 'y-..', label='Sigmoid', linewidth=2)
    plt.ylim([0,1])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image2|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [9]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.tanh([-1.,0.,1.])))
    y_tanh = sess.run(tf.nn.tanh(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [-0.7615942  0.         0.7615942]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [10]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_tanh, 'b:', label='Tanh', linewidth=2)
    plt.ylim([-2,2])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image3|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [11]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.softsign([-1.,0.,1.])))
    y_softsign = sess.run(tf.nn.softsign(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [-0.5  0.   0.5]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [13]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_softsign, 'g-.', label='Softsign', linewidth=2)
    plt.ylim([-1,1])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image4|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [18]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=15,num=100)
    print(sess.run(tf.nn.softplus([-1.,0.,1.])))
    y_softplus = sess.run(tf.nn.softplus(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [0.31326166 0.6931472  1.3132616 ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [19]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_softplus, 'r--', label='Softplus', linewidth=2)
    plt.ylim([-2,15])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image5|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [20]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    x_vals = np.linspace(start=-10,stop=10,num=100)
    print(sess.run(tf.nn.elu([-1., 0., 1.])))
    y_elu = sess.run(tf.nn.elu(x_vals))

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_subarea output_stream output_stdout output_text">

::

    [-0.63212055  0.          1.        ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [22]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_elu, 'k-', label='ExpLU', linewidth=0.5)
    plt.ylim([-2,10])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image6|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [12]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_softplus, 'r--', label='Softplus', linewidth=2)
    plt.plot(x_vals, y_relu, 'b:', label='ReLU', linewidth=2)
    plt.plot(x_vals, y_relu6, 'g-.', label='ReLU6', linewidth=2)
    plt.plot(x_vals, y_elu, 'k-', label='ExpLU', linewidth=0.5)
    plt.ylim([-5,11])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image7|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [11]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

    plt.plot(x_vals, y_sigmoid, 'r--', label='Sigmoid', linewidth=2)
    plt.plot(x_vals, y_tanh, 'b:', label='Tanh', linewidth=2)
    plt.plot(x_vals, y_softsign, 'g-.', label='Softsign', linewidth=2)
    plt.ylim([-2,2])
    plt.legend(loc='upper left')
    plt.show()

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="output_wrapper">

.. raw:: html

   <div class="output">

.. raw:: html

   <div class="output_area">

.. raw:: html

   <div class="prompt">

.. raw:: html

   </div>

.. raw:: html

   <div class="output_png output_subarea">

|image8|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="cell border-box-sizing code_cell rendered">

.. raw:: html

   <div class="input">

.. raw:: html

   <div class="prompt input_prompt">

In [ ]:

.. raw:: html

   </div>

.. raw:: html

   <div class="inner_cell">

.. raw:: html

   <div class="input_area">

.. raw:: html

   <div class="highlight hl-ipython3">

::

     

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |image0| image:: data:image/png;base64,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%0A
.. |image1| image:: data:image/png;base64,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%0A
.. |image2| image:: data:image/png;base64,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%0A
.. |image3| image:: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXsAAAD6CAYAAABApefCAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAADl0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uIDIuMS4yLCBodHRwOi8vbWF0cGxvdGxpYi5vcmcvNQv5yAAAGvhJREFUeJzt3XuUFPWd9/H3VxgcGBFRkYhkFFaCsgoqY5AN4MCKmkSfGNfFXXPU9bJ48ggJZuOaLJ6Y+GjMoxGTI944Ei/sSpY8OaLGjQIZJhIj6oxZLi7gdVRuihBBlIvo9/nj15PuGWamu2u6u3qmPq9z+kzNt3/V9a061d+p+VXVr8zdERGR7u2AuBMQEZHiU7EXEUkAFXsRkQRQsRcRSQAVexGRBFCxFxFJABV7EZEEiFTszayfmf3WzBaZ2aNm1quddnPN7Dkzu75zaYqISGdEPbL/BjDL3c8ENgNnt25gZucDPdx9LDDUzIZFT1NERDqjZ5SZ3P3ujF8HAO+10awWWJCaXgSMA17NbGBmU4GpAFVVVaOPO+64KOmIiCRWY2Pj++4+IFu7SMW+mZmNBfq7+/I23q4CNqSmtwGntG7g7nOAOQA1NTXe0NDQmXRERBLHzN7KpV3kYm9mhwJ3An/XTpOdQO/U9EHoZLCISGyinqDtBfwK+L67t/dXpZHQdQMwCmiKsiwREem8qEf2VxC6ZWaa2UxgKVDh7plX3SwElpnZIODLwGmdylRERCKLeoL2HuCeLG12mFktMBm41d2357ucTz75hPXr17N79+4oaZa1yspKBg8eTEVFRdypiEgCdOoEbTbu/mfSV+Tkbf369fTt25djjjkGMytgZvFyd7Zu3cr69esZMmRI3OmISAKU9UnT3bt3c9hhh3WrQg9gZhx22GHd8j8WESlPZV3sgW5X6Jt11/USkfJU9sVeREQ6T8U+i9mzZ1NbW0vv3r2pra3l0UcfzWm+H/7wh9TX1xc3ORGRHBX1BG13MG3aNKZNm8axxx6r4i0iXVaXOrI3C69M554bYk88kY7NmRNiU6emYxs3htigQZ3LYefOnZx99tmMHz+eyy67DAhH8TNnzmTChAmcdNJJbN68GYDFixfvFxMRiUOXKvblYNOmTUyfPp0lS5bQ1NTEu+++C8Brr73GM888w/nnn09dXV27MRGROHSpbhz3/WOZR/TNpk5teVQP4Yi+rfnzVVFRwf33388DDzzAtm3b2LVrFwCXXHIJANXV1ezdu7fdmIhIHHRkn6e5c+dywQUXMH/+fKqqqv4Sz5zuKCYiEgcV+zxNnjyZW265hUmTJgGwYcOGLHOIiMTPvBB9GwXQ1nj2a9as4fjjj48po+Lr7usnIsVnZo3uXpOtnY7sRUQSoOyLfbn851Fo3XW9RKQ8lXWxr6ysZOvWrd2uMDaPellZWRl3KiKSEGV96eXgwYNZv349W7ZsiTuVgmsez15EpBTKuthXVFRovHcRkQIo624cEREpjMjF3swGmtmyDt4/yszWm1l96jUg6rJERKRzInXjmFl/4CGgo1tExwA3p55XKyIiMYp6ZP8pcCGwo4M2pwFXmtlLZvbjiMsREZECiFTs3X2Hu2/P0uy3QC1wKjDWzEZGWZaIiHReMU/Q/tHdP3T3T4E/AcNaNzCzqWbWYGYN3fHyShGRclHMYv+0mR1pZn2AM4HVrRu4+xx3r3H3mgEDdP5WRKRYCnKdvZlNAka4++yM8I+ApcBe4F53X1eIZYmISP46VezdvTb1sw6oa/XeUuC4zny+iIgUhm6qEhFJABV7EZEEULEXEUkAFXsRkQRQsRcRSQAVexGRBFCxFxFJABV7EZEEULEXEUkAFXsRkQRQsRcRSQAVexGRBFCxFxFJABV7EZEEULEXEUkAFXsRkQRQsRcRSQAVexGRBFCxFxFJABV7EZEEiFzszWygmS3r4P0KM3vCzJ41s8ujLkdERDovUrE3s/7AQ0BVB82mA43u/iXgAjPrG2VZIhLdRx/B++/Dvn3p2ObNsGoVbNmSjm3fDn/8Y4hneuYZqKtrOf+qVbB4MWzalI5t2gSLFsHKlenYvn3w9NOwZEnLz3zxxRDfujUda2oKsbVrW+b+1FMhh9Y5PfVUeL/Z2rUh9uab6di2bSH2/PMt51+8OMQz12nFihDbuDEd27gxxFasaLlOTz0VPiPTCy+EeOY6vflmiOWyTiXh7nm/gIOBfkB9B20eB0akpr8HTOzoM0ePHu0ikt3q1e533eX++9+nY2vXuh9/vPsZZ7RsO3SoO7i/8ko6ds01IXb77enY0qUhdvrpLeevqgrxHTvSsX/8xxD7j/9Ixx55JMT+4R/SsQ8/DLGqqpafWVsb4nV16djtt4fYNdekY+vWhdiwYS3n/8IXQnzt2nTsX/4lxG67LR2rrw+xCRNazt+3b4hv314+69QZQIPnULd7RvwDsQPAzDpqVgVsSE1vAwa2bmBmU4GpANXV1VFSEenW5s+H3/wGvvc9OPHEEFu0CL7zHZg2DSZMCLHKSlizBj7+uOX8hx4KH3wAn32Wjg0aBCecAP37p2P9+sHYsfDXf91y/tNPh1274ICMPoATToAzzoCBGd/oz30OJk9O5wjQoweceWbILVNNDfTqFXJrdvTRoe3w4elYnz5w1llw1FEt5x8/HoYMCe83Gz48tD3mmHSsf/8Qy8wJQu4ffxzyazZyZPhP4Mgj07EjjwzzjxzZcp3OOmv/dTr1VDjwwJbrdMwxoW0u61QKFv4wRJzZrN7da9t57zHgKnffbGbfATa7+yPtfVZNTY03NDREzkWkO1izBo4/Pv37lCnwq1/Bgw/CpZeG2B/+AA8/HIrWlCkhtm9f6C7o1w8+//mSpy0xMrNGd6/J1i7SkX2OGoFxwP8DRgHLi7gskS7t00/DEetzz4U+4uajySuugIkTYdKkdNtx48IrU8+e4YhbpD0FKfZmNonQPz87I/wQ8F9mNh4YATzf5swiQo8eMGYMrFsHr7+eLvZnnRVvXtJ9dKobJ+uHmw0iHN0/7e7bO2qrbhxJkr17YeZMuPjidGHfsSP0ZbfuDxbpSK7dOEW9qcrdN7r7gmyFXiRpfvrT8LrootCFA3DwwSr0Ujy6g1YkBjNmwFe/Cvff3/KqEJFiKeYJWhHJ8O67cMQRYBYuwfvNb+LOSJJER/YiJdDUBKNHw9VXt7zmXaRUVOxFSmDdujBswerVsGdP3NlIEqkbR6QEzjoLli6FESOgd++4s5EkUrEXKSL30EcPYTgCkbioG0ekSDZuhJNP3n+ERJE4qNiLFMkdd4ShD372s7gzEVE3jkjR3HJLuNTyoovizkRExV6kaHr2hGuvjTsLkUDdOCIFtmYN7N4ddxYiLanYixTQJ5/AOefAX/0VvPJK3NmIpKkbR6SANm2Cvn1DF87QoXFnI5KmYi9SQNXV8NJLoej31LdLyoi6cUQK7IAD4nnGqEhHVOxFCmTePNi6Ne4sRNqmYi9SAC+9BJdcAieemH4YiUg5Ua+iSAG4h8HORozQw0ikPEUu9mY2l/Ag8Sfd/aY23u8JvJF6AUx391VRlydSzkaPhqeeCkVfpBxF6sYxs/OBHu4+FhhqZsPaaDYSmO/utamXCr10e80jXIqUm6h99rXAgtT0ImBcG21OA84xsxfMbG7qSF+k25k9G15/Pe4sRDoWtdhXARtS09uAgW20eRE4w92/CFQAX2ndwMymmlmDmTVs2bIlYioi8Vm1CqZPh5oaPYFKylvUo+2dQPPzdg6i7T8aK929efdvAPbr6nH3OcAcgJqaGvV2SpdTWQmXXgqHHw4HHhh3NiLti3pk30i662YU0NRGm3lmNsrMegDnASsiLkukbA0bBg8+CD/9adyZiHQsarFfCFxsZrOAKcDLZtb6ipwbgXnAfwPPufuS6GmKiEhnROrGcfcdZlYLTAZudffNtDpyd/fVhCtyRLqlxx6Dww6Dv/mbMESCSDmLvIu6+5/dfUGq0Iskijt8+9swfjwsXx53NiLZ6XhEJIJdu+Dv/z4c1Z92WtzZiGSna99FIujTB267Le4sRHKnI3sRkQRQsRfJ02uvwcKFoStHpKtQsRfJ0wMPwNe/DtddF3cmIrlTsRfJ05AhMGYMnHde3JmI5E4naEXydOWV4SXSlejIXkQkAVTsRfKwZAlogFbpilTsRXL08cdw7rnwuc/pweLS9ajPXiRHW7bA6afDzp1hTByRrkTFXiRHRx8dnjP72WdxZyKSP3XjiORJI1xKV6TdViQH770X7pwV6apU7EVy8OCD4alU114bdyYi0ajYi+Rg92445BA49dS4MxGJxtzL4znfNTU13tDQEHcaIu3aty88tKSiIu5MRNLMrNHda7K109U4IjnqqW+LdGGRu3HMbK6ZPWdm13emjUi527BBl1tK1xep2JvZ+UAPdx8LDDWzYVHaiJQ7dxg3DgYNgqamuLMRiS7qkX0tsCA1vQgYF7GNSFl7//3QV//pp1BdHXc2ItFFLfZVwIbU9DZgYJQ2ZjbVzBrMrGGLRpeSMjRgALz9NqxYoZuppGuLuvvuBHqnpg9q53OytnH3Oe5e4+41AwYMiJiKSHGZhW4cka4sarFvJN0tMwpoithGpGzt2wd798adhUhhRC32C4GLzWwWMAV42cxuytLmyehpipTe734Hhx8O//qvcWci0nmRir277yCcgF0OTHT3Fe5+fZY22zuXqkhpNTbChx/q+nrpHnQHrUgH3n47FHv12Uu50h20IgWgyy2lu9DFZCJt0B2z0t2o2Iu04bzzYNIk+J//iTsTkcJQN45IK3v2QF1deMC4bv+Q7kLFXqSVAw+Ed96B559XsZfuQ904Im3o3x/OPjvuLEQKR8VeRCQBVOxFMqxcCaecAnfcEXcmIoWlYi+S4ckn4U9/gtWr485EpLB0glYkwzXXwMknw8C2Bu0W6cJU7EUyVFbqxKx0T+rGERFJABV7kZRvfAO+9S3YvDnuTEQKT8VeBNiyBX75S7j33tCVI9LdqM9ehPCQkuXLw6WXhxwSdzYihadiL0J4zuypp4aXSHekbhwRkQRQsZfEe+QRuOgi+MMf4s5EpHhU7CXx5s2D+fNh7dq4MxEpnrz77M1sLjACeNLdb2qnTU/gjdQLYLq7r4qcpUgR3XUX/PrX4YElIt1VXkf2ZnY+0MPdxwJDzWxYO01HAvPdvTb1UqGXsjV0KFx7bbgiR6S7yrcbpxZYkJpeBIxrp91pwDlm9oKZzU0d6e/HzKaaWYOZNWzZsiXPVEREJFcdFnszu8/M6ptfwHRgQ+rtbUB7w0W9CJzh7l8EKoCvtNXI3ee4e4271wzQI4GkxOrqYMIEeOyxuDMRKb4O++zd/arM383s50Dv1K8H0f4fi5Xuvic13QC0190jEpsHHoBly+Bv/xa+9rW4sxEprny7cRpJd92MApraaTfPzEaZWQ/gPGBFtPREiufuu2HOHLjiirgzESm+fK/GWQgsM7NBwJeB08xsBHCRu1+f0e5G4BHAgMfdfUlBshUpoL594Z//Oe4sREojr2Lv7jvMrBaYDNzq7tuB7cD1rdqtJlyRI1J2PvsM9u2DXr3izkSkdPK+qcrd/+zuC9xdA8FKl/ToozB8OCxYkL2tSHehO2glcebPh6YmeP/9uDMRKR2NeimJ85//Ge6Y1RU4kiQq9pI4PXrAlClxZyFSWurGkcR4+WXYuTPuLETioWIvibBvH1xwAQwZEp5GJZI06saRRPjgAzjiCNi7F44/Pu5sREpPxV4S4fDDYelSeOcdqKiIOxuR0lM3jnRr7unpAw6Ao4+OLxeROKnYS7d2ww1w5ZWwY0fcmYjES8Veuq2dO+Gee+AXv9BJWRH12Uu3ddBBsHgxLFoE49p7zI5IQqjYS7fzySfpk7AnnRReIkmnbhzpVp59NgxytkSDaou0oGIv3crTT8Obb8Ls2XFnIlJe1I0jXd6ePXDggWH6hhvgyCPDFTgikqYje+mydu2Cb38bjjsOPv44xHr0gG9+UzdOibSmYi9dymefpacrK0MffVNTuOpGRNqnYi9dxowZUF0NGzeG383CdfQrVmhsepFsIhV7MxtoZsuytKkwsyfM7FkzuzxaetLdffJJODJ/9dWW8csvh7Fjw2iVzd55BzZsgMcfT8dOPRVG6mnHIlnlXezNrD/wEFCVpel0oNHdvwRcYGZ9I+SXk7o6uOaalkXg3XdD7JZbWra9+eYQ37IlHVu4MMTq69OxV18Nsbvuajn/ddeF+J496djDD4fYSy+lY42NITZvXjq2a1eIff/7LT/zzjtD/PXXs6/TjBnw4x+3nP+mm0I8c50efTTEMtfplVdCH3frK1W++1341rdartMvfgFXXx3Wo9nzz8NVV8HcuenYRx/BpZeGeKbrroMvfzmMId9szhz4whfg9tvTsZUrw7DDrR8msmQJLF8Ob7yRjv3gB+EovvWyRCQH7p7XCzgY6AfUZ2n3ODAiNf09YGIbbaYCDUBDdXW1R3Xrre7g/t3vpmNr1oTY8OEt2x57bIi/8ko6NmNGiM2alY797nchNnFiy/n79AnxnTvTsQsvDLH589Oxf//3ELvoonTsgw9C7OCDW37m+PEh/vvfl886TZmy/zrNm9f+OvXt2/Y61denY7fdFmIzZqRjb73lPniw+9lnt5x/4UL3Zcvcd+1yEekA0OA51O6sl16a2X3A8IxQnbvfaGbZZq0CNqSmtwED2/hDMweYA1BTU+Ot38/VxIkwaxaMHp2OHXFEiPXv37Ltv/1bGNv88MPTsa99LfQFn356OnbssWH+z3++5fw/+UnoWujVKx27+GIYMwZOPjkdO+WUMP9xx6VjlZUhljkvwLRp8PWvw9Ch2dfpjjv2X6eZM/dfp/POCyM8TpiQjg0bBj/7GQwe3HL+227bf50uuwzGj2+5/DFj4N57w+c069MHHnxw/3W65ZaQ0wknpGP/9E9w7rkt86yuDt0zrakPXqSwzD1ajTWzenev7eD9x4Cr3H2zmX0H2Ozuj7TXvqamxhsaGiLlIiKSVGbW6O412doV82qcRqB5+KlRQFMRlyUiIh0oyB20ZjaJ0D+feervIeC/zGw8MAJ4vhDLEhGR/EU+ss/swnH3ulaFHnd/C5gMPAuc4e6fRl2WiIh0TlHHxnH3jcCCYi5DRESy0x20IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCaBiLyKSACr2IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCaBiLyKSACr2IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCRCp2JvZQDNblqXNUWa23szqU68B0VIUEZHOyvuxhGbWn/Aw8aosTccAN7v7PVESExGRwolyZP8pcCGwI0u704ArzewlM/txhOWIiEiBZD2yN7P7gOEZoTp3v9HMss36W+D/AB8DS8xspLuvjJypiIhElrXYu/tVET/7j+6+B8DM/gQMA1oUezObCkwFqK6ujrgYERHJpphX4zxtZkeaWR/gTGB16wbuPsfda9y9ZsAAnb8VESmWvE/QtsXMJgEj3H12RvhHwFJgL3Cvu68rxLJERCR/kYu9u9dmTNcBda3eXwocFzkzEREpGN1UJSKSACr2IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCaBiLyKSACr2IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCaBiLyKSACr2IiIJoGIvIpIAKvYiIgmgYi8ikgAq9iIiCaBiLyKSACr2IiIJkHexN7N+ZvZbM1tkZo+aWa8O2s41s+fM7PrOpSkiIp0R5cj+G8Asdz8T2Ayc3VYjMzsf6OHuY4GhZjYsepoiItIZPfOdwd3vzvh1APBeO01rgQWp6UXAOODVfJcnIiKdl7XYm9l9wPCMUJ2732hmY4H+7r68nVmrgA2p6W3AKW189lRgaurXnWa2LufM93c48H4n5i8W5ZUf5ZUf5ZWf7pjX0bk0ylrs3f2q1jEzOxS4E/i7DmbdCfROTR9EG11G7j4HmJNLotmYWYO71xTiswpJeeVHeeVHeeUnyXlFOUHbC/gV8H13f6uDpo2ErhuAUUBT3tmJiEhBRDlBewWhS2ammdWb2YVmNsLMbmrVbiFwsZnNAqYAT3YyVxERiSjKCdp7gHvaeOv6Vu12mFktMBm41d23R8owdwXpDioC5ZUf5ZUf5ZWfxOZl7l7sZYiISMx0B62ISALk3Y0jbTOzbwIXpn49BHi+nSuZegJvpF4A0919VWmyLB9m1g/4JdAD+Ai40N33ttEu8dsrl22l7ZSWy3cxkdvL3bvECxgILMv4vQJ4AngWuLyD+XJqV+Bc7wRq2nnvFOD/lnC79QTeBupTrxM7aPsj4EXgrhLk9b+Byanpe4D/VSbbay7wHHB9Z9qUeluV635Vyn2qneW3+V2MYXv9pX7FVbu6RDeOmfUHHiLcqNVsOtDo7l8CLjCzvu3Mnmu7QuV6FDDQ3RvaaXIacI6ZvZAaO6jY/12NBOa7e23q1ebRi5mNJlwq+0XgPTM7o5hJufvd7r449WtHd2KXbHvlMsRHHMOA5Litym6/KvU+1cbyO/oulnK/al2/YqldXaLYA58S/i3bkRGrJT0cwzNAezck5NouL2Z2X+rS0+bXD1JvXU3bVys1exE4w92/SPjL/ZVC5NOBXHfq04FfezikeBoYX8gk2tteOdyJXcrtVcv+Q3xEaVMUWbZVOe5XRd2nctDRd7GU26t1/aolhtpVln32HQzRkNms9XAMA9v5uFzb5cXb7o8/AJgIzOxg1pXuvic13QAU9MiwjW23lLBTbzKzhwk79eNtzFoFvJ6aLth2atbO9srlTuyibq9Wsg7xkWObgsthW5VyO0G6WHa0XxV1n+pIDt/Fkm0vd9+Ryqk5FEvtKssje3e/KuPfw1p3v7GNZlmHY8izXSGMJ5wM6uh61nlmNsrMegDnASsKmUDrbQf8xN03pd7uaKcu5XbK507som6vVnLZBiXdTpDztirldoJQLLPtVyXfVhmyfRdLvb0yxVK7yrLY5yjX4RhKOWzDWYR/twBo587iG4F5wH8Dz7n7kiLmA7nv1KUe3iLXO7FLub1y2QZxDAPSelvd0EX2qziHTPnLd7EM9qvW4qldpTobXaAz2vUZ00cDLwM/J/xL2QOYBExrNc9+7eJejxJvsxOAlcAq4OZU7FDg/lbtDiCc9f85sA4YEnfuMWyrgwlFaxawJvUFuylLm35x510O+5X2qZy2WX3qZyy1q0vfQWtmgwh/+Z72DoZjyLVd0plZb+CrwEvu/ka29t1R6sqJycAz7r45ahsJtE+1LY7a1aWLvYiI5KYr99mLiEiOVOxFRBJAxV5EJAFU7EVEEkDFXkQkAf4/zBort55x2i4AAAAASUVORK5CYII=%0A
.. |image4| image:: data:image/png;base64,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%0A
.. |image5| image:: data:image/png;base64,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%0A
.. |image6| image:: data:image/png;base64,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%0A
.. |image7| image:: data:image/png;base64,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%0A
.. |image8| image:: data:image/png;base64,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%0A

