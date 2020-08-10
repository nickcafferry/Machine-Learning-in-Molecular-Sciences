.. raw:: html

   <!DOCTYPE html>
	<html>
	<head><meta charset="utf-8" />
	
	<title>Activation Functions</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	
	
	
	<style type="text/css">
	    /*!
	*
	* Twitter Bootstrap
	*
	*/
	/*!
	 * Bootstrap v3.3.7 (http://getbootstrap.com)
	 * Copyright 2011-2016 Twitter, Inc.
	 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
	 */
	/*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */
	html {
	  font-family: sans-serif;
	  -ms-text-size-adjust: 100%;
	  -webkit-text-size-adjust: 100%;
	}
	body {
	  margin: 0;
	}
	article,
	aside,
	details,
	figcaption,
	figure,
	footer,
	header,
	hgroup,
	main,
	menu,
	nav,
	section,
	summary {
	  display: block;
	}
	audio,
	canvas,
	progress,
	video {
	  display: inline-block;
	  vertical-align: baseline;
	}
	audio:not([controls]) {
	  display: none;
	  height: 0;
	}
	[hidden],
	template {
	  display: none;
	}
	a {
	  background-color: transparent;
	}
	a:active,
	a:hover {
	  outline: 0;
	}
	abbr[title] {
	  border-bottom: 1px dotted;
	}
	b,
	strong {
	  font-weight: bold;
	}
	dfn {
	  font-style: italic;
	}
	h1 {
	  font-size: 2em;
	  margin: 0.67em 0;
	}
	mark {
	  background: #ff0;
	  color: #000;
	}
	small {
	  font-size: 80%;
	}
	sub,
	sup {
	  font-size: 75%;
	  line-height: 0;
	  position: relative;
	  vertical-align: baseline;
	}
	sup {
	  top: -0.5em;
	}
	sub {
	  bottom: -0.25em;
	}
	img {
	  border: 0;
	}
	svg:not(:root) {
	  overflow: hidden;
	}
	figure {
	  margin: 1em 40px;
	}
	hr {
	  box-sizing: content-box;
	  height: 0;
	}
	pre {
	  overflow: auto;
	}
	code,
	kbd,
	pre,
	samp {
	  font-family: monospace, monospace;
	  font-size: 1em;
	}
	button,
	input,
	optgroup,
	select,
	textarea {
	  color: inherit;
	  font: inherit;
	  margin: 0;
	}
	button {
	  overflow: visible;
	}
	button,
	select {
	  text-transform: none;
	}
	button,
	html input[type="button"],
	input[type="reset"],
	input[type="submit"] {
	  -webkit-appearance: button;
	  cursor: pointer;
	}
	button[disabled],
	html input[disabled] {
	  cursor: default;
	}
	button::-moz-focus-inner,
	input::-moz-focus-inner {
	  border: 0;
	  padding: 0;
	}
	input {
	  line-height: normal;
	}
	input[type="checkbox"],
	input[type="radio"] {
	  box-sizing: border-box;
	  padding: 0;
	}
	input[type="number"]::-webkit-inner-spin-button,
	input[type="number"]::-webkit-outer-spin-button {
	  height: auto;
	}
	input[type="search"] {
	  -webkit-appearance: textfield;
	  box-sizing: content-box;
	}
	input[type="search"]::-webkit-search-cancel-button,
	input[type="search"]::-webkit-search-decoration {
	  -webkit-appearance: none;
	}
	fieldset {
	  border: 1px solid #c0c0c0;
	  margin: 0 2px;
	  padding: 0.35em 0.625em 0.75em;
	}
	legend {
	  border: 0;
	  padding: 0;
	}
	textarea {
	  overflow: auto;
	}
	optgroup {
	  font-weight: bold;
	}
	table {
	  border-collapse: collapse;
	  border-spacing: 0;
	}
	td,
	th {
	  padding: 0;
	}
	/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */
	@media print {
	  *,
	  *:before,
	  *:after {
	    background: transparent !important;
	    box-shadow: none !important;
	    text-shadow: none !important;
	  }
	  a,
	  a:visited {
	    text-decoration: underline;
	  }
	  a[href]:after {
	    content: " (" attr(href) ")";
	  }
	  abbr[title]:after {
	    content: " (" attr(title) ")";
	  }
	  a[href^="#"]:after,
	  a[href^="javascript:"]:after {
	    content: "";
	  }
	  pre,
	  blockquote {
	    border: 1px solid #999;
	    page-break-inside: avoid;
	  }
	  thead {
	    display: table-header-group;
	  }
	  tr,
	  img {
	    page-break-inside: avoid;
	  }
	  img {
	    max-width: 100% !important;
	  }
	  p,
	  h2,
	  h3 {
	    orphans: 3;
	    widows: 3;
	  }
	  h2,
	  h3 {
	    page-break-after: avoid;
	  }
	  .navbar {
	    display: none;
	  }
	  .btn > .caret,
	  .dropup > .btn > .caret {
	    border-top-color: #000 !important;
	  }
	  .label {
	    border: 1px solid #000;
	  }
	  .table {
	    border-collapse: collapse !important;
	  }
	  .table td,
	  .table th {
	    background-color: #fff !important;
	  }
	  .table-bordered th,
	  .table-bordered td {
	    border: 1px solid #ddd !important;
	  }
	}
	@font-face {
	  font-family: 'Glyphicons Halflings';
	  src: url('../components/bootstrap/fonts/glyphicons-halflings-regular.eot');
	  src: url('../components/bootstrap/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('../components/bootstrap/fonts/glyphicons-halflings-regular.woff2') format('woff2'), url('../components/bootstrap/fonts/glyphicons-halflings-regular.woff') format('woff'), url('../components/bootstrap/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('../components/bootstrap/fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
	}
	.glyphicon {
	  position: relative;
	  top: 1px;
	  display: inline-block;
	  font-family: 'Glyphicons Halflings';
	  font-style: normal;
	  font-weight: normal;
	  line-height: 1;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	}
	.glyphicon-asterisk:before {
	  content: "\002a";
	}
	.glyphicon-plus:before {
	  content: "\002b";
	}
	.glyphicon-euro:before,
	.glyphicon-eur:before {
	  content: "\20ac";
	}
	.glyphicon-minus:before {
	  content: "\2212";
	}
	.glyphicon-cloud:before {
	  content: "\2601";
	}
	.glyphicon-envelope:before {
	  content: "\2709";
	}
	.glyphicon-pencil:before {
	  content: "\270f";
	}
	.glyphicon-glass:before {
	  content: "\e001";
	}
	.glyphicon-music:before {
	  content: "\e002";
	}
	.glyphicon-search:before {
	  content: "\e003";
	}
	.glyphicon-heart:before {
	  content: "\e005";
	}
	.glyphicon-star:before {
	  content: "\e006";
	}
	.glyphicon-star-empty:before {
	  content: "\e007";
	}
	.glyphicon-user:before {
	  content: "\e008";
	}
	.glyphicon-film:before {
	  content: "\e009";
	}
	.glyphicon-th-large:before {
	  content: "\e010";
	}
	.glyphicon-th:before {
	  content: "\e011";
	}
	.glyphicon-th-list:before {
	  content: "\e012";
	}
	.glyphicon-ok:before {
	  content: "\e013";
	}
	.glyphicon-remove:before {
	  content: "\e014";
	}
	.glyphicon-zoom-in:before {
	  content: "\e015";
	}
	.glyphicon-zoom-out:before {
	  content: "\e016";
	}
	.glyphicon-off:before {
	  content: "\e017";
	}
	.glyphicon-signal:before {
	  content: "\e018";
	}
	.glyphicon-cog:before {
	  content: "\e019";
	}
	.glyphicon-trash:before {
	  content: "\e020";
	}
	.glyphicon-home:before {
	  content: "\e021";
	}
	.glyphicon-file:before {
	  content: "\e022";
	}
	.glyphicon-time:before {
	  content: "\e023";
	}
	.glyphicon-road:before {
	  content: "\e024";
	}
	.glyphicon-download-alt:before {
	  content: "\e025";
	}
	.glyphicon-download:before {
	  content: "\e026";
	}
	.glyphicon-upload:before {
	  content: "\e027";
	}
	.glyphicon-inbox:before {
	  content: "\e028";
	}
	.glyphicon-play-circle:before {
	  content: "\e029";
	}
	.glyphicon-repeat:before {
	  content: "\e030";
	}
	.glyphicon-refresh:before {
	  content: "\e031";
	}
	.glyphicon-list-alt:before {
	  content: "\e032";
	}
	.glyphicon-lock:before {
	  content: "\e033";
	}
	.glyphicon-flag:before {
	  content: "\e034";
	}
	.glyphicon-headphones:before {
	  content: "\e035";
	}
	.glyphicon-volume-off:before {
	  content: "\e036";
	}
	.glyphicon-volume-down:before {
	  content: "\e037";
	}
	.glyphicon-volume-up:before {
	  content: "\e038";
	}
	.glyphicon-qrcode:before {
	  content: "\e039";
	}
	.glyphicon-barcode:before {
	  content: "\e040";
	}
	.glyphicon-tag:before {
	  content: "\e041";
	}
	.glyphicon-tags:before {
	  content: "\e042";
	}
	.glyphicon-book:before {
	  content: "\e043";
	}
	.glyphicon-bookmark:before {
	  content: "\e044";
	}
	.glyphicon-print:before {
	  content: "\e045";
	}
	.glyphicon-camera:before {
	  content: "\e046";
	}
	.glyphicon-font:before {
	  content: "\e047";
	}
	.glyphicon-bold:before {
	  content: "\e048";
	}
	.glyphicon-italic:before {
	  content: "\e049";
	}
	.glyphicon-text-height:before {
	  content: "\e050";
	}
	.glyphicon-text-width:before {
	  content: "\e051";
	}
	.glyphicon-align-left:before {
	  content: "\e052";
	}
	.glyphicon-align-center:before {
	  content: "\e053";
	}
	.glyphicon-align-right:before {
	  content: "\e054";
	}
	.glyphicon-align-justify:before {
	  content: "\e055";
	}
	.glyphicon-list:before {
	  content: "\e056";
	}
	.glyphicon-indent-left:before {
	  content: "\e057";
	}
	.glyphicon-indent-right:before {
	  content: "\e058";
	}
	.glyphicon-facetime-video:before {
	  content: "\e059";
	}
	.glyphicon-picture:before {
	  content: "\e060";
	}
	.glyphicon-map-marker:before {
	  content: "\e062";
	}
	.glyphicon-adjust:before {
	  content: "\e063";
	}
	.glyphicon-tint:before {
	  content: "\e064";
	}
	.glyphicon-edit:before {
	  content: "\e065";
	}
	.glyphicon-share:before {
	  content: "\e066";
	}
	.glyphicon-check:before {
	  content: "\e067";
	}
	.glyphicon-move:before {
	  content: "\e068";
	}
	.glyphicon-step-backward:before {
	  content: "\e069";
	}
	.glyphicon-fast-backward:before {
	  content: "\e070";
	}
	.glyphicon-backward:before {
	  content: "\e071";
	}
	.glyphicon-play:before {
	  content: "\e072";
	}
	.glyphicon-pause:before {
	  content: "\e073";
	}
	.glyphicon-stop:before {
	  content: "\e074";
	}
	.glyphicon-forward:before {
	  content: "\e075";
	}
	.glyphicon-fast-forward:before {
	  content: "\e076";
	}
	.glyphicon-step-forward:before {
	  content: "\e077";
	}
	.glyphicon-eject:before {
	  content: "\e078";
	}
	.glyphicon-chevron-left:before {
	  content: "\e079";
	}
	.glyphicon-chevron-right:before {
	  content: "\e080";
	}
	.glyphicon-plus-sign:before {
	  content: "\e081";
	}
	.glyphicon-minus-sign:before {
	  content: "\e082";
	}
	.glyphicon-remove-sign:before {
	  content: "\e083";
	}
	.glyphicon-ok-sign:before {
	  content: "\e084";
	}
	.glyphicon-question-sign:before {
	  content: "\e085";
	}
	.glyphicon-info-sign:before {
	  content: "\e086";
	}
	.glyphicon-screenshot:before {
	  content: "\e087";
	}
	.glyphicon-remove-circle:before {
	  content: "\e088";
	}
	.glyphicon-ok-circle:before {
	  content: "\e089";
	}
	.glyphicon-ban-circle:before {
	  content: "\e090";
	}
	.glyphicon-arrow-left:before {
	  content: "\e091";
	}
	.glyphicon-arrow-right:before {
	  content: "\e092";
	}
	.glyphicon-arrow-up:before {
	  content: "\e093";
	}
	.glyphicon-arrow-down:before {
	  content: "\e094";
	}
	.glyphicon-share-alt:before {
	  content: "\e095";
	}
	.glyphicon-resize-full:before {
	  content: "\e096";
	}
	.glyphicon-resize-small:before {
	  content: "\e097";
	}
	.glyphicon-exclamation-sign:before {
	  content: "\e101";
	}
	.glyphicon-gift:before {
	  content: "\e102";
	}
	.glyphicon-leaf:before {
	  content: "\e103";
	}
	.glyphicon-fire:before {
	  content: "\e104";
	}
	.glyphicon-eye-open:before {
	  content: "\e105";
	}
	.glyphicon-eye-close:before {
	  content: "\e106";
	}
	.glyphicon-warning-sign:before {
	  content: "\e107";
	}
	.glyphicon-plane:before {
	  content: "\e108";
	}
	.glyphicon-calendar:before {
	  content: "\e109";
	}
	.glyphicon-random:before {
	  content: "\e110";
	}
	.glyphicon-comment:before {
	  content: "\e111";
	}
	.glyphicon-magnet:before {
	  content: "\e112";
	}
	.glyphicon-chevron-up:before {
	  content: "\e113";
	}
	.glyphicon-chevron-down:before {
	  content: "\e114";
	}
	.glyphicon-retweet:before {
	  content: "\e115";
	}
	.glyphicon-shopping-cart:before {
	  content: "\e116";
	}
	.glyphicon-folder-close:before {
	  content: "\e117";
	}
	.glyphicon-folder-open:before {
	  content: "\e118";
	}
	.glyphicon-resize-vertical:before {
	  content: "\e119";
	}
	.glyphicon-resize-horizontal:before {
	  content: "\e120";
	}
	.glyphicon-hdd:before {
	  content: "\e121";
	}
	.glyphicon-bullhorn:before {
	  content: "\e122";
	}
	.glyphicon-bell:before {
	  content: "\e123";
	}
	.glyphicon-certificate:before {
	  content: "\e124";
	}
	.glyphicon-thumbs-up:before {
	  content: "\e125";
	}
	.glyphicon-thumbs-down:before {
	  content: "\e126";
	}
	.glyphicon-hand-right:before {
	  content: "\e127";
	}
	.glyphicon-hand-left:before {
	  content: "\e128";
	}
	.glyphicon-hand-up:before {
	  content: "\e129";
	}
	.glyphicon-hand-down:before {
	  content: "\e130";
	}
	.glyphicon-circle-arrow-right:before {
	  content: "\e131";
	}
	.glyphicon-circle-arrow-left:before {
	  content: "\e132";
	}
	.glyphicon-circle-arrow-up:before {
	  content: "\e133";
	}
	.glyphicon-circle-arrow-down:before {
	  content: "\e134";
	}
	.glyphicon-globe:before {
	  content: "\e135";
	}
	.glyphicon-wrench:before {
	  content: "\e136";
	}
	.glyphicon-tasks:before {
	  content: "\e137";
	}
	.glyphicon-filter:before {
	  content: "\e138";
	}
	.glyphicon-briefcase:before {
	  content: "\e139";
	}
	.glyphicon-fullscreen:before {
	  content: "\e140";
	}
	.glyphicon-dashboard:before {
	  content: "\e141";
	}
	.glyphicon-paperclip:before {
	  content: "\e142";
	}
	.glyphicon-heart-empty:before {
	  content: "\e143";
	}
	.glyphicon-link:before {
	  content: "\e144";
	}
	.glyphicon-phone:before {
	  content: "\e145";
	}
	.glyphicon-pushpin:before {
	  content: "\e146";
	}
	.glyphicon-usd:before {
	  content: "\e148";
	}
	.glyphicon-gbp:before {
	  content: "\e149";
	}
	.glyphicon-sort:before {
	  content: "\e150";
	}
	.glyphicon-sort-by-alphabet:before {
	  content: "\e151";
	}
	.glyphicon-sort-by-alphabet-alt:before {
	  content: "\e152";
	}
	.glyphicon-sort-by-order:before {
	  content: "\e153";
	}
	.glyphicon-sort-by-order-alt:before {
	  content: "\e154";
	}
	.glyphicon-sort-by-attributes:before {
	  content: "\e155";
	}
	.glyphicon-sort-by-attributes-alt:before {
	  content: "\e156";
	}
	.glyphicon-unchecked:before {
	  content: "\e157";
	}
	.glyphicon-expand:before {
	  content: "\e158";
	}
	.glyphicon-collapse-down:before {
	  content: "\e159";
	}
	.glyphicon-collapse-up:before {
	  content: "\e160";
	}
	.glyphicon-log-in:before {
	  content: "\e161";
	}
	.glyphicon-flash:before {
	  content: "\e162";
	}
	.glyphicon-log-out:before {
	  content: "\e163";
	}
	.glyphicon-new-window:before {
	  content: "\e164";
	}
	.glyphicon-record:before {
	  content: "\e165";
	}
	.glyphicon-save:before {
	  content: "\e166";
	}
	.glyphicon-open:before {
	  content: "\e167";
	}
	.glyphicon-saved:before {
	  content: "\e168";
	}
	.glyphicon-import:before {
	  content: "\e169";
	}
	.glyphicon-export:before {
	  content: "\e170";
	}
	.glyphicon-send:before {
	  content: "\e171";
	}
	.glyphicon-floppy-disk:before {
	  content: "\e172";
	}
	.glyphicon-floppy-saved:before {
	  content: "\e173";
	}
	.glyphicon-floppy-remove:before {
	  content: "\e174";
	}
	.glyphicon-floppy-save:before {
	  content: "\e175";
	}
	.glyphicon-floppy-open:before {
	  content: "\e176";
	}
	.glyphicon-credit-card:before {
	  content: "\e177";
	}
	.glyphicon-transfer:before {
	  content: "\e178";
	}
	.glyphicon-cutlery:before {
	  content: "\e179";
	}
	.glyphicon-header:before {
	  content: "\e180";
	}
	.glyphicon-compressed:before {
	  content: "\e181";
	}
	.glyphicon-earphone:before {
	  content: "\e182";
	}
	.glyphicon-phone-alt:before {
	  content: "\e183";
	}
	.glyphicon-tower:before {
	  content: "\e184";
	}
	.glyphicon-stats:before {
	  content: "\e185";
	}
	.glyphicon-sd-video:before {
	  content: "\e186";
	}
	.glyphicon-hd-video:before {
	  content: "\e187";
	}
	.glyphicon-subtitles:before {
	  content: "\e188";
	}
	.glyphicon-sound-stereo:before {
	  content: "\e189";
	}
	.glyphicon-sound-dolby:before {
	  content: "\e190";
	}
	.glyphicon-sound-5-1:before {
	  content: "\e191";
	}
	.glyphicon-sound-6-1:before {
	  content: "\e192";
	}
	.glyphicon-sound-7-1:before {
	  content: "\e193";
	}
	.glyphicon-copyright-mark:before {
	  content: "\e194";
	}
	.glyphicon-registration-mark:before {
	  content: "\e195";
	}
	.glyphicon-cloud-download:before {
	  content: "\e197";
	}
	.glyphicon-cloud-upload:before {
	  content: "\e198";
	}
	.glyphicon-tree-conifer:before {
	  content: "\e199";
	}
	.glyphicon-tree-deciduous:before {
	  content: "\e200";
	}
	.glyphicon-cd:before {
	  content: "\e201";
	}
	.glyphicon-save-file:before {
	  content: "\e202";
	}
	.glyphicon-open-file:before {
	  content: "\e203";
	}
	.glyphicon-level-up:before {
	  content: "\e204";
	}
	.glyphicon-copy:before {
	  content: "\e205";
	}
	.glyphicon-paste:before {
	  content: "\e206";
	}
	.glyphicon-alert:before {
	  content: "\e209";
	}
	.glyphicon-equalizer:before {
	  content: "\e210";
	}
	.glyphicon-king:before {
	  content: "\e211";
	}
	.glyphicon-queen:before {
	  content: "\e212";
	}
	.glyphicon-pawn:before {
	  content: "\e213";
	}
	.glyphicon-bishop:before {
	  content: "\e214";
	}
	.glyphicon-knight:before {
	  content: "\e215";
	}
	.glyphicon-baby-formula:before {
	  content: "\e216";
	}
	.glyphicon-tent:before {
	  content: "\26fa";
	}
	.glyphicon-blackboard:before {
	  content: "\e218";
	}
	.glyphicon-bed:before {
	  content: "\e219";
	}
	.glyphicon-apple:before {
	  content: "\f8ff";
	}
	.glyphicon-erase:before {
	  content: "\e221";
	}
	.glyphicon-hourglass:before {
	  content: "\231b";
	}
	.glyphicon-lamp:before {
	  content: "\e223";
	}
	.glyphicon-duplicate:before {
	  content: "\e224";
	}
	.glyphicon-piggy-bank:before {
	  content: "\e225";
	}
	.glyphicon-scissors:before {
	  content: "\e226";
	}
	.glyphicon-bitcoin:before {
	  content: "\e227";
	}
	.glyphicon-btc:before {
	  content: "\e227";
	}
	.glyphicon-xbt:before {
	  content: "\e227";
	}
	.glyphicon-yen:before {
	  content: "\00a5";
	}
	.glyphicon-jpy:before {
	  content: "\00a5";
	}
	.glyphicon-ruble:before {
	  content: "\20bd";
	}
	.glyphicon-rub:before {
	  content: "\20bd";
	}
	.glyphicon-scale:before {
	  content: "\e230";
	}
	.glyphicon-ice-lolly:before {
	  content: "\e231";
	}
	.glyphicon-ice-lolly-tasted:before {
	  content: "\e232";
	}
	.glyphicon-education:before {
	  content: "\e233";
	}
	.glyphicon-option-horizontal:before {
	  content: "\e234";
	}
	.glyphicon-option-vertical:before {
	  content: "\e235";
	}
	.glyphicon-menu-hamburger:before {
	  content: "\e236";
	}
	.glyphicon-modal-window:before {
	  content: "\e237";
	}
	.glyphicon-oil:before {
	  content: "\e238";
	}
	.glyphicon-grain:before {
	  content: "\e239";
	}
	.glyphicon-sunglasses:before {
	  content: "\e240";
	}
	.glyphicon-text-size:before {
	  content: "\e241";
	}
	.glyphicon-text-color:before {
	  content: "\e242";
	}
	.glyphicon-text-background:before {
	  content: "\e243";
	}
	.glyphicon-object-align-top:before {
	  content: "\e244";
	}
	.glyphicon-object-align-bottom:before {
	  content: "\e245";
	}
	.glyphicon-object-align-horizontal:before {
	  content: "\e246";
	}
	.glyphicon-object-align-left:before {
	  content: "\e247";
	}
	.glyphicon-object-align-vertical:before {
	  content: "\e248";
	}
	.glyphicon-object-align-right:before {
	  content: "\e249";
	}
	.glyphicon-triangle-right:before {
	  content: "\e250";
	}
	.glyphicon-triangle-left:before {
	  content: "\e251";
	}
	.glyphicon-triangle-bottom:before {
	  content: "\e252";
	}
	.glyphicon-triangle-top:before {
	  content: "\e253";
	}
	.glyphicon-console:before {
	  content: "\e254";
	}
	.glyphicon-superscript:before {
	  content: "\e255";
	}
	.glyphicon-subscript:before {
	  content: "\e256";
	}
	.glyphicon-menu-left:before {
	  content: "\e257";
	}
	.glyphicon-menu-right:before {
	  content: "\e258";
	}
	.glyphicon-menu-down:before {
	  content: "\e259";
	}
	.glyphicon-menu-up:before {
	  content: "\e260";
	}
	* {
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	}
	*:before,
	*:after {
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	}
	html {
	  font-size: 10px;
	  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	}
	body {
	  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #000;
	  background-color: #fff;
	}
	input,
	button,
	select,
	textarea {
	  font-family: inherit;
	  font-size: inherit;
	  line-height: inherit;
	}
	a {
	  color: #337ab7;
	  text-decoration: none;
	}
	a:hover,
	a:focus {
	  color: #23527c;
	  text-decoration: underline;
	}
	a:focus {
	  outline: 5px auto -webkit-focus-ring-color;
	  outline-offset: -2px;
	}
	figure {
	  margin: 0;
	}
	img {
	  vertical-align: middle;
	}
	.img-responsive,
	.thumbnail > img,
	.thumbnail a > img,
	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img {
	  display: block;
	  max-width: 100%;
	  height: auto;
	}
	.img-rounded {
	  border-radius: 3px;
	}
	.img-thumbnail {
	  padding: 4px;
	  line-height: 1.42857143;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  border-radius: 2px;
	  -webkit-transition: all 0.2s ease-in-out;
	  -o-transition: all 0.2s ease-in-out;
	  transition: all 0.2s ease-in-out;
	  display: inline-block;
	  max-width: 100%;
	  height: auto;
	}
	.img-circle {
	  border-radius: 50%;
	}
	hr {
	  margin-top: 18px;
	  margin-bottom: 18px;
	  border: 0;
	  border-top: 1px solid #eeeeee;
	}
	.sr-only {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  margin: -1px;
	  padding: 0;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}
	.sr-only-focusable:active,
	.sr-only-focusable:focus {
	  position: static;
	  width: auto;
	  height: auto;
	  margin: 0;
	  overflow: visible;
	  clip: auto;
	}
	[role="button"] {
	  cursor: pointer;
	}
	h1,
	h2,
	h3,
	h4,
	h5,
	h6,
	.h1,
	.h2,
	.h3,
	.h4,
	.h5,
	.h6 {
	  font-family: inherit;
	  font-weight: 500;
	  line-height: 1.1;
	  color: inherit;
	}
	h1 small,
	h2 small,
	h3 small,
	h4 small,
	h5 small,
	h6 small,
	.h1 small,
	.h2 small,
	.h3 small,
	.h4 small,
	.h5 small,
	.h6 small,
	h1 .small,
	h2 .small,
	h3 .small,
	h4 .small,
	h5 .small,
	h6 .small,
	.h1 .small,
	.h2 .small,
	.h3 .small,
	.h4 .small,
	.h5 .small,
	.h6 .small {
	  font-weight: normal;
	  line-height: 1;
	  color: #777777;
	}
	h1,
	.h1,
	h2,
	.h2,
	h3,
	.h3 {
	  margin-top: 18px;
	  margin-bottom: 9px;
	}
	h1 small,
	.h1 small,
	h2 small,
	.h2 small,
	h3 small,
	.h3 small,
	h1 .small,
	.h1 .small,
	h2 .small,
	.h2 .small,
	h3 .small,
	.h3 .small {
	  font-size: 65%;
	}
	h4,
	.h4,
	h5,
	.h5,
	h6,
	.h6 {
	  margin-top: 9px;
	  margin-bottom: 9px;
	}
	h4 small,
	.h4 small,
	h5 small,
	.h5 small,
	h6 small,
	.h6 small,
	h4 .small,
	.h4 .small,
	h5 .small,
	.h5 .small,
	h6 .small,
	.h6 .small {
	  font-size: 75%;
	}
	h1,
	.h1 {
	  font-size: 33px;
	}
	h2,
	.h2 {
	  font-size: 27px;
	}
	h3,
	.h3 {
	  font-size: 23px;
	}
	h4,
	.h4 {
	  font-size: 17px;
	}
	h5,
	.h5 {
	  font-size: 13px;
	}
	h6,
	.h6 {
	  font-size: 12px;
	}
	p {
	  margin: 0 0 9px;
	}
	.lead {
	  margin-bottom: 18px;
	  font-size: 14px;
	  font-weight: 300;
	  line-height: 1.4;
	}
	@media (min-width: 768px) {
	  .lead {
	    font-size: 19.5px;
	  }
	}
	small,
	.small {
	  font-size: 92%;
	}
	mark,
	.mark {
	  background-color: #fcf8e3;
	  padding: .2em;
	}
	.text-left {
	  text-align: left;
	}
	.text-right {
	  text-align: right;
	}
	.text-center {
	  text-align: center;
	}
	.text-justify {
	  text-align: justify;
	}
	.text-nowrap {
	  white-space: nowrap;
	}
	.text-lowercase {
	  text-transform: lowercase;
	}
	.text-uppercase {
	  text-transform: uppercase;
	}
	.text-capitalize {
	  text-transform: capitalize;
	}
	.text-muted {
	  color: #777777;
	}
	.text-primary {
	  color: #337ab7;
	}
	a.text-primary:hover,
	a.text-primary:focus {
	  color: #286090;
	}
	.text-success {
	  color: #3c763d;
	}
	a.text-success:hover,
	a.text-success:focus {
	  color: #2b542c;
	}
	.text-info {
	  color: #31708f;
	}
	a.text-info:hover,
	a.text-info:focus {
	  color: #245269;
	}
	.text-warning {
	  color: #8a6d3b;
	}
	a.text-warning:hover,
	a.text-warning:focus {
	  color: #66512c;
	}
	.text-danger {
	  color: #a94442;
	}
	a.text-danger:hover,
	a.text-danger:focus {
	  color: #843534;
	}
	.bg-primary {
	  color: #fff;
	  background-color: #337ab7;
	}
	a.bg-primary:hover,
	a.bg-primary:focus {
	  background-color: #286090;
	}
	.bg-success {
	  background-color: #dff0d8;
	}
	a.bg-success:hover,
	a.bg-success:focus {
	  background-color: #c1e2b3;
	}
	.bg-info {
	  background-color: #d9edf7;
	}
	a.bg-info:hover,
	a.bg-info:focus {
	  background-color: #afd9ee;
	}
	.bg-warning {
	  background-color: #fcf8e3;
	}
	a.bg-warning:hover,
	a.bg-warning:focus {
	  background-color: #f7ecb5;
	}
	.bg-danger {
	  background-color: #f2dede;
	}
	a.bg-danger:hover,
	a.bg-danger:focus {
	  background-color: #e4b9b9;
	}
	.page-header {
	  padding-bottom: 8px;
	  margin: 36px 0 18px;
	  border-bottom: 1px solid #eeeeee;
	}
	ul,
	ol {
	  margin-top: 0;
	  margin-bottom: 9px;
	}
	ul ul,
	ol ul,
	ul ol,
	ol ol {
	  margin-bottom: 0;
	}
	.list-unstyled {
	  padding-left: 0;
	  list-style: none;
	}
	.list-inline {
	  padding-left: 0;
	  list-style: none;
	  margin-left: -5px;
	}
	.list-inline > li {
	  display: inline-block;
	  padding-left: 5px;
	  padding-right: 5px;
	}
	dl {
	  margin-top: 0;
	  margin-bottom: 18px;
	}
	dt,
	dd {
	  line-height: 1.42857143;
	}
	dt {
	  font-weight: bold;
	}
	dd {
	  margin-left: 0;
	}
	@media (min-width: 541px) {
	  .dl-horizontal dt {
	    float: left;
	    width: 160px;
	    clear: left;
	    text-align: right;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	  }
	  .dl-horizontal dd {
	    margin-left: 180px;
	  }
	}
	abbr[title],
	abbr[data-original-title] {
	  cursor: help;
	  border-bottom: 1px dotted #777777;
	}
	.initialism {
	  font-size: 90%;
	  text-transform: uppercase;
	}
	blockquote {
	  padding: 9px 18px;
	  margin: 0 0 18px;
	  font-size: inherit;
	  border-left: 5px solid #eeeeee;
	}
	blockquote p:last-child,
	blockquote ul:last-child,
	blockquote ol:last-child {
	  margin-bottom: 0;
	}
	blockquote footer,
	blockquote small,
	blockquote .small {
	  display: block;
	  font-size: 80%;
	  line-height: 1.42857143;
	  color: #777777;
	}
	blockquote footer:before,
	blockquote small:before,
	blockquote .small:before {
	  content: '\2014 \00A0';
	}
	.blockquote-reverse,
	blockquote.pull-right {
	  padding-right: 15px;
	  padding-left: 0;
	  border-right: 5px solid #eeeeee;
	  border-left: 0;
	  text-align: right;
	}
	.blockquote-reverse footer:before,
	blockquote.pull-right footer:before,
	.blockquote-reverse small:before,
	blockquote.pull-right small:before,
	.blockquote-reverse .small:before,
	blockquote.pull-right .small:before {
	  content: '';
	}
	.blockquote-reverse footer:after,
	blockquote.pull-right footer:after,
	.blockquote-reverse small:after,
	blockquote.pull-right small:after,
	.blockquote-reverse .small:after,
	blockquote.pull-right .small:after {
	  content: '\00A0 \2014';
	}
	address {
	  margin-bottom: 18px;
	  font-style: normal;
	  line-height: 1.42857143;
	}
	code,
	kbd,
	pre,
	samp {
	  font-family: monospace;
	}
	code {
	  padding: 2px 4px;
	  font-size: 90%;
	  color: #c7254e;
	  background-color: #f9f2f4;
	  border-radius: 2px;
	}
	kbd {
	  padding: 2px 4px;
	  font-size: 90%;
	  color: #888;
	  background-color: transparent;
	  border-radius: 1px;
	  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.25);
	}
	kbd kbd {
	  padding: 0;
	  font-size: 100%;
	  font-weight: bold;
	  box-shadow: none;
	}
	pre {
	  display: block;
	  padding: 8.5px;
	  margin: 0 0 9px;
	  font-size: 12px;
	  line-height: 1.42857143;
	  word-break: break-all;
	  word-wrap: break-word;
	  color: #333333;
	  background-color: #f5f5f5;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	}
	pre code {
	  padding: 0;
	  font-size: inherit;
	  color: inherit;
	  white-space: pre-wrap;
	  background-color: transparent;
	  border-radius: 0;
	}
	.pre-scrollable {
	  max-height: 340px;
	  overflow-y: scroll;
	}
	.container {
	  margin-right: auto;
	  margin-left: auto;
	  padding-left: 0px;
	  padding-right: 0px;
	}
	@media (min-width: 768px) {
	  .container {
	    width: 768px;
	  }
	}
	@media (min-width: 992px) {
	  .container {
	    width: 940px;
	  }
	}
	@media (min-width: 1200px) {
	  .container {
	    width: 1140px;
	  }
	}
	.container-fluid {
	  margin-right: auto;
	  margin-left: auto;
	  padding-left: 0px;
	  padding-right: 0px;
	}
	.row {
	  margin-left: 0px;
	  margin-right: 0px;
	}
	.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
	  position: relative;
	  min-height: 1px;
	  padding-left: 0px;
	  padding-right: 0px;
	}
	.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
	  float: left;
	}
	.col-xs-12 {
	  width: 100%;
	}
	.col-xs-11 {
	  width: 91.66666667%;
	}
	.col-xs-10 {
	  width: 83.33333333%;
	}
	.col-xs-9 {
	  width: 75%;
	}
	.col-xs-8 {
	  width: 66.66666667%;
	}
	.col-xs-7 {
	  width: 58.33333333%;
	}
	.col-xs-6 {
	  width: 50%;
	}
	.col-xs-5 {
	  width: 41.66666667%;
	}
	.col-xs-4 {
	  width: 33.33333333%;
	}
	.col-xs-3 {
	  width: 25%;
	}
	.col-xs-2 {
	  width: 16.66666667%;
	}
	.col-xs-1 {
	  width: 8.33333333%;
	}
	.col-xs-pull-12 {
	  right: 100%;
	}
	.col-xs-pull-11 {
	  right: 91.66666667%;
	}
	.col-xs-pull-10 {
	  right: 83.33333333%;
	}
	.col-xs-pull-9 {
	  right: 75%;
	}
	.col-xs-pull-8 {
	  right: 66.66666667%;
	}
	.col-xs-pull-7 {
	  right: 58.33333333%;
	}
	.col-xs-pull-6 {
	  right: 50%;
	}
	.col-xs-pull-5 {
	  right: 41.66666667%;
	}
	.col-xs-pull-4 {
	  right: 33.33333333%;
	}
	.col-xs-pull-3 {
	  right: 25%;
	}
	.col-xs-pull-2 {
	  right: 16.66666667%;
	}
	.col-xs-pull-1 {
	  right: 8.33333333%;
	}
	.col-xs-pull-0 {
	  right: auto;
	}
	.col-xs-push-12 {
	  left: 100%;
	}
	.col-xs-push-11 {
	  left: 91.66666667%;
	}
	.col-xs-push-10 {
	  left: 83.33333333%;
	}
	.col-xs-push-9 {
	  left: 75%;
	}
	.col-xs-push-8 {
	  left: 66.66666667%;
	}
	.col-xs-push-7 {
	  left: 58.33333333%;
	}
	.col-xs-push-6 {
	  left: 50%;
	}
	.col-xs-push-5 {
	  left: 41.66666667%;
	}
	.col-xs-push-4 {
	  left: 33.33333333%;
	}
	.col-xs-push-3 {
	  left: 25%;
	}
	.col-xs-push-2 {
	  left: 16.66666667%;
	}
	.col-xs-push-1 {
	  left: 8.33333333%;
	}
	.col-xs-push-0 {
	  left: auto;
	}
	.col-xs-offset-12 {
	  margin-left: 100%;
	}
	.col-xs-offset-11 {
	  margin-left: 91.66666667%;
	}
	.col-xs-offset-10 {
	  margin-left: 83.33333333%;
	}
	.col-xs-offset-9 {
	  margin-left: 75%;
	}
	.col-xs-offset-8 {
	  margin-left: 66.66666667%;
	}
	.col-xs-offset-7 {
	  margin-left: 58.33333333%;
	}
	.col-xs-offset-6 {
	  margin-left: 50%;
	}
	.col-xs-offset-5 {
	  margin-left: 41.66666667%;
	}
	.col-xs-offset-4 {
	  margin-left: 33.33333333%;
	}
	.col-xs-offset-3 {
	  margin-left: 25%;
	}
	.col-xs-offset-2 {
	  margin-left: 16.66666667%;
	}
	.col-xs-offset-1 {
	  margin-left: 8.33333333%;
	}
	.col-xs-offset-0 {
	  margin-left: 0%;
	}
	@media (min-width: 768px) {
	  .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
	    float: left;
	  }
	  .col-sm-12 {
	    width: 100%;
	  }
	  .col-sm-11 {
	    width: 91.66666667%;
	  }
	  .col-sm-10 {
	    width: 83.33333333%;
	  }
	  .col-sm-9 {
	    width: 75%;
	  }
	  .col-sm-8 {
	    width: 66.66666667%;
	  }
	  .col-sm-7 {
	    width: 58.33333333%;
	  }
	  .col-sm-6 {
	    width: 50%;
	  }
	  .col-sm-5 {
	    width: 41.66666667%;
	  }
	  .col-sm-4 {
	    width: 33.33333333%;
	  }
	  .col-sm-3 {
	    width: 25%;
	  }
	  .col-sm-2 {
	    width: 16.66666667%;
	  }
	  .col-sm-1 {
	    width: 8.33333333%;
	  }
	  .col-sm-pull-12 {
	    right: 100%;
	  }
	  .col-sm-pull-11 {
	    right: 91.66666667%;
	  }
	  .col-sm-pull-10 {
	    right: 83.33333333%;
	  }
	  .col-sm-pull-9 {
	    right: 75%;
	  }
	  .col-sm-pull-8 {
	    right: 66.66666667%;
	  }
	  .col-sm-pull-7 {
	    right: 58.33333333%;
	  }
	  .col-sm-pull-6 {
	    right: 50%;
	  }
	  .col-sm-pull-5 {
	    right: 41.66666667%;
	  }
	  .col-sm-pull-4 {
	    right: 33.33333333%;
	  }
	  .col-sm-pull-3 {
	    right: 25%;
	  }
	  .col-sm-pull-2 {
	    right: 16.66666667%;
	  }
	  .col-sm-pull-1 {
	    right: 8.33333333%;
	  }
	  .col-sm-pull-0 {
	    right: auto;
	  }
	  .col-sm-push-12 {
	    left: 100%;
	  }
	  .col-sm-push-11 {
	    left: 91.66666667%;
	  }
	  .col-sm-push-10 {
	    left: 83.33333333%;
	  }
	  .col-sm-push-9 {
	    left: 75%;
	  }
	  .col-sm-push-8 {
	    left: 66.66666667%;
	  }
	  .col-sm-push-7 {
	    left: 58.33333333%;
	  }
	  .col-sm-push-6 {
	    left: 50%;
	  }
	  .col-sm-push-5 {
	    left: 41.66666667%;
	  }
	  .col-sm-push-4 {
	    left: 33.33333333%;
	  }
	  .col-sm-push-3 {
	    left: 25%;
	  }
	  .col-sm-push-2 {
	    left: 16.66666667%;
	  }
	  .col-sm-push-1 {
	    left: 8.33333333%;
	  }
	  .col-sm-push-0 {
	    left: auto;
	  }
	  .col-sm-offset-12 {
	    margin-left: 100%;
	  }
	  .col-sm-offset-11 {
	    margin-left: 91.66666667%;
	  }
	  .col-sm-offset-10 {
	    margin-left: 83.33333333%;
	  }
	  .col-sm-offset-9 {
	    margin-left: 75%;
	  }
	  .col-sm-offset-8 {
	    margin-left: 66.66666667%;
	  }
	  .col-sm-offset-7 {
	    margin-left: 58.33333333%;
	  }
	  .col-sm-offset-6 {
	    margin-left: 50%;
	  }
	  .col-sm-offset-5 {
	    margin-left: 41.66666667%;
	  }
	  .col-sm-offset-4 {
	    margin-left: 33.33333333%;
	  }
	  .col-sm-offset-3 {
	    margin-left: 25%;
	  }
	  .col-sm-offset-2 {
	    margin-left: 16.66666667%;
	  }
	  .col-sm-offset-1 {
	    margin-left: 8.33333333%;
	  }
	  .col-sm-offset-0 {
	    margin-left: 0%;
	  }
	}
	@media (min-width: 992px) {
	  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
	    float: left;
	  }
	  .col-md-12 {
	    width: 100%;
	  }
	  .col-md-11 {
	    width: 91.66666667%;
	  }
	  .col-md-10 {
	    width: 83.33333333%;
	  }
	  .col-md-9 {
	    width: 75%;
	  }
	  .col-md-8 {
	    width: 66.66666667%;
	  }
	  .col-md-7 {
	    width: 58.33333333%;
	  }
	  .col-md-6 {
	    width: 50%;
	  }
	  .col-md-5 {
	    width: 41.66666667%;
	  }
	  .col-md-4 {
	    width: 33.33333333%;
	  }
	  .col-md-3 {
	    width: 25%;
	  }
	  .col-md-2 {
	    width: 16.66666667%;
	  }
	  .col-md-1 {
	    width: 8.33333333%;
	  }
	  .col-md-pull-12 {
	    right: 100%;
	  }
	  .col-md-pull-11 {
	    right: 91.66666667%;
	  }
	  .col-md-pull-10 {
	    right: 83.33333333%;
	  }
	  .col-md-pull-9 {
	    right: 75%;
	  }
	  .col-md-pull-8 {
	    right: 66.66666667%;
	  }
	  .col-md-pull-7 {
	    right: 58.33333333%;
	  }
	  .col-md-pull-6 {
	    right: 50%;
	  }
	  .col-md-pull-5 {
	    right: 41.66666667%;
	  }
	  .col-md-pull-4 {
	    right: 33.33333333%;
	  }
	  .col-md-pull-3 {
	    right: 25%;
	  }
	  .col-md-pull-2 {
	    right: 16.66666667%;
	  }
	  .col-md-pull-1 {
	    right: 8.33333333%;
	  }
	  .col-md-pull-0 {
	    right: auto;
	  }
	  .col-md-push-12 {
	    left: 100%;
	  }
	  .col-md-push-11 {
	    left: 91.66666667%;
	  }
	  .col-md-push-10 {
	    left: 83.33333333%;
	  }
	  .col-md-push-9 {
	    left: 75%;
	  }
	  .col-md-push-8 {
	    left: 66.66666667%;
	  }
	  .col-md-push-7 {
	    left: 58.33333333%;
	  }
	  .col-md-push-6 {
	    left: 50%;
	  }
	  .col-md-push-5 {
	    left: 41.66666667%;
	  }
	  .col-md-push-4 {
	    left: 33.33333333%;
	  }
	  .col-md-push-3 {
	    left: 25%;
	  }
	  .col-md-push-2 {
	    left: 16.66666667%;
	  }
	  .col-md-push-1 {
	    left: 8.33333333%;
	  }
	  .col-md-push-0 {
	    left: auto;
	  }
	  .col-md-offset-12 {
	    margin-left: 100%;
	  }
	  .col-md-offset-11 {
	    margin-left: 91.66666667%;
	  }
	  .col-md-offset-10 {
	    margin-left: 83.33333333%;
	  }
	  .col-md-offset-9 {
	    margin-left: 75%;
	  }
	  .col-md-offset-8 {
	    margin-left: 66.66666667%;
	  }
	  .col-md-offset-7 {
	    margin-left: 58.33333333%;
	  }
	  .col-md-offset-6 {
	    margin-left: 50%;
	  }
	  .col-md-offset-5 {
	    margin-left: 41.66666667%;
	  }
	  .col-md-offset-4 {
	    margin-left: 33.33333333%;
	  }
	  .col-md-offset-3 {
	    margin-left: 25%;
	  }
	  .col-md-offset-2 {
	    margin-left: 16.66666667%;
	  }
	  .col-md-offset-1 {
	    margin-left: 8.33333333%;
	  }
	  .col-md-offset-0 {
	    margin-left: 0%;
	  }
	}
	@media (min-width: 1200px) {
	  .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
	    float: left;
	  }
	  .col-lg-12 {
	    width: 100%;
	  }
	  .col-lg-11 {
	    width: 91.66666667%;
	  }
	  .col-lg-10 {
	    width: 83.33333333%;
	  }
	  .col-lg-9 {
	    width: 75%;
	  }
	  .col-lg-8 {
	    width: 66.66666667%;
	  }
	  .col-lg-7 {
	    width: 58.33333333%;
	  }
	  .col-lg-6 {
	    width: 50%;
	  }
	  .col-lg-5 {
	    width: 41.66666667%;
	  }
	  .col-lg-4 {
	    width: 33.33333333%;
	  }
	  .col-lg-3 {
	    width: 25%;
	  }
	  .col-lg-2 {
	    width: 16.66666667%;
	  }
	  .col-lg-1 {
	    width: 8.33333333%;
	  }
	  .col-lg-pull-12 {
	    right: 100%;
	  }
	  .col-lg-pull-11 {
	    right: 91.66666667%;
	  }
	  .col-lg-pull-10 {
	    right: 83.33333333%;
	  }
	  .col-lg-pull-9 {
	    right: 75%;
	  }
	  .col-lg-pull-8 {
	    right: 66.66666667%;
	  }
	  .col-lg-pull-7 {
	    right: 58.33333333%;
	  }
	  .col-lg-pull-6 {
	    right: 50%;
	  }
	  .col-lg-pull-5 {
	    right: 41.66666667%;
	  }
	  .col-lg-pull-4 {
	    right: 33.33333333%;
	  }
	  .col-lg-pull-3 {
	    right: 25%;
	  }
	  .col-lg-pull-2 {
	    right: 16.66666667%;
	  }
	  .col-lg-pull-1 {
	    right: 8.33333333%;
	  }
	  .col-lg-pull-0 {
	    right: auto;
	  }
	  .col-lg-push-12 {
	    left: 100%;
	  }
	  .col-lg-push-11 {
	    left: 91.66666667%;
	  }
	  .col-lg-push-10 {
	    left: 83.33333333%;
	  }
	  .col-lg-push-9 {
	    left: 75%;
	  }
	  .col-lg-push-8 {
	    left: 66.66666667%;
	  }
	  .col-lg-push-7 {
	    left: 58.33333333%;
	  }
	  .col-lg-push-6 {
	    left: 50%;
	  }
	  .col-lg-push-5 {
	    left: 41.66666667%;
	  }
	  .col-lg-push-4 {
	    left: 33.33333333%;
	  }
	  .col-lg-push-3 {
	    left: 25%;
	  }
	  .col-lg-push-2 {
	    left: 16.66666667%;
	  }
	  .col-lg-push-1 {
	    left: 8.33333333%;
	  }
	  .col-lg-push-0 {
	    left: auto;
	  }
	  .col-lg-offset-12 {
	    margin-left: 100%;
	  }
	  .col-lg-offset-11 {
	    margin-left: 91.66666667%;
	  }
	  .col-lg-offset-10 {
	    margin-left: 83.33333333%;
	  }
	  .col-lg-offset-9 {
	    margin-left: 75%;
	  }
	  .col-lg-offset-8 {
	    margin-left: 66.66666667%;
	  }
	  .col-lg-offset-7 {
	    margin-left: 58.33333333%;
	  }
	  .col-lg-offset-6 {
	    margin-left: 50%;
	  }
	  .col-lg-offset-5 {
	    margin-left: 41.66666667%;
	  }
	  .col-lg-offset-4 {
	    margin-left: 33.33333333%;
	  }
	  .col-lg-offset-3 {
	    margin-left: 25%;
	  }
	  .col-lg-offset-2 {
	    margin-left: 16.66666667%;
	  }
	  .col-lg-offset-1 {
	    margin-left: 8.33333333%;
	  }
	  .col-lg-offset-0 {
	    margin-left: 0%;
	  }
	}
	table {
	  background-color: transparent;
	}
	caption {
	  padding-top: 8px;
	  padding-bottom: 8px;
	  color: #777777;
	  text-align: left;
	}
	th {
	  text-align: left;
	}
	.table {
	  width: 100%;
	  max-width: 100%;
	  margin-bottom: 18px;
	}
	.table > thead > tr > th,
	.table > tbody > tr > th,
	.table > tfoot > tr > th,
	.table > thead > tr > td,
	.table > tbody > tr > td,
	.table > tfoot > tr > td {
	  padding: 8px;
	  line-height: 1.42857143;
	  vertical-align: top;
	  border-top: 1px solid #ddd;
	}
	.table > thead > tr > th {
	  vertical-align: bottom;
	  border-bottom: 2px solid #ddd;
	}
	.table > caption + thead > tr:first-child > th,
	.table > colgroup + thead > tr:first-child > th,
	.table > thead:first-child > tr:first-child > th,
	.table > caption + thead > tr:first-child > td,
	.table > colgroup + thead > tr:first-child > td,
	.table > thead:first-child > tr:first-child > td {
	  border-top: 0;
	}
	.table > tbody + tbody {
	  border-top: 2px solid #ddd;
	}
	.table .table {
	  background-color: #fff;
	}
	.table-condensed > thead > tr > th,
	.table-condensed > tbody > tr > th,
	.table-condensed > tfoot > tr > th,
	.table-condensed > thead > tr > td,
	.table-condensed > tbody > tr > td,
	.table-condensed > tfoot > tr > td {
	  padding: 5px;
	}
	.table-bordered {
	  border: 1px solid #ddd;
	}
	.table-bordered > thead > tr > th,
	.table-bordered > tbody > tr > th,
	.table-bordered > tfoot > tr > th,
	.table-bordered > thead > tr > td,
	.table-bordered > tbody > tr > td,
	.table-bordered > tfoot > tr > td {
	  border: 1px solid #ddd;
	}
	.table-bordered > thead > tr > th,
	.table-bordered > thead > tr > td {
	  border-bottom-width: 2px;
	}
	.table-striped > tbody > tr:nth-of-type(odd) {
	  background-color: #f9f9f9;
	}
	.table-hover > tbody > tr:hover {
	  background-color: #f5f5f5;
	}
	table col[class*="col-"] {
	  position: static;
	  float: none;
	  display: table-column;
	}
	table td[class*="col-"],
	table th[class*="col-"] {
	  position: static;
	  float: none;
	  display: table-cell;
	}
	.table > thead > tr > td.active,
	.table > tbody > tr > td.active,
	.table > tfoot > tr > td.active,
	.table > thead > tr > th.active,
	.table > tbody > tr > th.active,
	.table > tfoot > tr > th.active,
	.table > thead > tr.active > td,
	.table > tbody > tr.active > td,
	.table > tfoot > tr.active > td,
	.table > thead > tr.active > th,
	.table > tbody > tr.active > th,
	.table > tfoot > tr.active > th {
	  background-color: #f5f5f5;
	}
	.table-hover > tbody > tr > td.active:hover,
	.table-hover > tbody > tr > th.active:hover,
	.table-hover > tbody > tr.active:hover > td,
	.table-hover > tbody > tr:hover > .active,
	.table-hover > tbody > tr.active:hover > th {
	  background-color: #e8e8e8;
	}
	.table > thead > tr > td.success,
	.table > tbody > tr > td.success,
	.table > tfoot > tr > td.success,
	.table > thead > tr > th.success,
	.table > tbody > tr > th.success,
	.table > tfoot > tr > th.success,
	.table > thead > tr.success > td,
	.table > tbody > tr.success > td,
	.table > tfoot > tr.success > td,
	.table > thead > tr.success > th,
	.table > tbody > tr.success > th,
	.table > tfoot > tr.success > th {
	  background-color: #dff0d8;
	}
	.table-hover > tbody > tr > td.success:hover,
	.table-hover > tbody > tr > th.success:hover,
	.table-hover > tbody > tr.success:hover > td,
	.table-hover > tbody > tr:hover > .success,
	.table-hover > tbody > tr.success:hover > th {
	  background-color: #d0e9c6;
	}
	.table > thead > tr > td.info,
	.table > tbody > tr > td.info,
	.table > tfoot > tr > td.info,
	.table > thead > tr > th.info,
	.table > tbody > tr > th.info,
	.table > tfoot > tr > th.info,
	.table > thead > tr.info > td,
	.table > tbody > tr.info > td,
	.table > tfoot > tr.info > td,
	.table > thead > tr.info > th,
	.table > tbody > tr.info > th,
	.table > tfoot > tr.info > th {
	  background-color: #d9edf7;
	}
	.table-hover > tbody > tr > td.info:hover,
	.table-hover > tbody > tr > th.info:hover,
	.table-hover > tbody > tr.info:hover > td,
	.table-hover > tbody > tr:hover > .info,
	.table-hover > tbody > tr.info:hover > th {
	  background-color: #c4e3f3;
	}
	.table > thead > tr > td.warning,
	.table > tbody > tr > td.warning,
	.table > tfoot > tr > td.warning,
	.table > thead > tr > th.warning,
	.table > tbody > tr > th.warning,
	.table > tfoot > tr > th.warning,
	.table > thead > tr.warning > td,
	.table > tbody > tr.warning > td,
	.table > tfoot > tr.warning > td,
	.table > thead > tr.warning > th,
	.table > tbody > tr.warning > th,
	.table > tfoot > tr.warning > th {
	  background-color: #fcf8e3;
	}
	.table-hover > tbody > tr > td.warning:hover,
	.table-hover > tbody > tr > th.warning:hover,
	.table-hover > tbody > tr.warning:hover > td,
	.table-hover > tbody > tr:hover > .warning,
	.table-hover > tbody > tr.warning:hover > th {
	  background-color: #faf2cc;
	}
	.table > thead > tr > td.danger,
	.table > tbody > tr > td.danger,
	.table > tfoot > tr > td.danger,
	.table > thead > tr > th.danger,
	.table > tbody > tr > th.danger,
	.table > tfoot > tr > th.danger,
	.table > thead > tr.danger > td,
	.table > tbody > tr.danger > td,
	.table > tfoot > tr.danger > td,
	.table > thead > tr.danger > th,
	.table > tbody > tr.danger > th,
	.table > tfoot > tr.danger > th {
	  background-color: #f2dede;
	}
	.table-hover > tbody > tr > td.danger:hover,
	.table-hover > tbody > tr > th.danger:hover,
	.table-hover > tbody > tr.danger:hover > td,
	.table-hover > tbody > tr:hover > .danger,
	.table-hover > tbody > tr.danger:hover > th {
	  background-color: #ebcccc;
	}
	.table-responsive {
	  overflow-x: auto;
	  min-height: 0.01%;
	}
	@media screen and (max-width: 767px) {
	  .table-responsive {
	    width: 100%;
	    margin-bottom: 13.5px;
	    overflow-y: hidden;
	    -ms-overflow-style: -ms-autohiding-scrollbar;
	    border: 1px solid #ddd;
	  }
	  .table-responsive > .table {
	    margin-bottom: 0;
	  }
	  .table-responsive > .table > thead > tr > th,
	  .table-responsive > .table > tbody > tr > th,
	  .table-responsive > .table > tfoot > tr > th,
	  .table-responsive > .table > thead > tr > td,
	  .table-responsive > .table > tbody > tr > td,
	  .table-responsive > .table > tfoot > tr > td {
	    white-space: nowrap;
	  }
	  .table-responsive > .table-bordered {
	    border: 0;
	  }
	  .table-responsive > .table-bordered > thead > tr > th:first-child,
	  .table-responsive > .table-bordered > tbody > tr > th:first-child,
	  .table-responsive > .table-bordered > tfoot > tr > th:first-child,
	  .table-responsive > .table-bordered > thead > tr > td:first-child,
	  .table-responsive > .table-bordered > tbody > tr > td:first-child,
	  .table-responsive > .table-bordered > tfoot > tr > td:first-child {
	    border-left: 0;
	  }
	  .table-responsive > .table-bordered > thead > tr > th:last-child,
	  .table-responsive > .table-bordered > tbody > tr > th:last-child,
	  .table-responsive > .table-bordered > tfoot > tr > th:last-child,
	  .table-responsive > .table-bordered > thead > tr > td:last-child,
	  .table-responsive > .table-bordered > tbody > tr > td:last-child,
	  .table-responsive > .table-bordered > tfoot > tr > td:last-child {
	    border-right: 0;
	  }
	  .table-responsive > .table-bordered > tbody > tr:last-child > th,
	  .table-responsive > .table-bordered > tfoot > tr:last-child > th,
	  .table-responsive > .table-bordered > tbody > tr:last-child > td,
	  .table-responsive > .table-bordered > tfoot > tr:last-child > td {
	    border-bottom: 0;
	  }
	}
	fieldset {
	  padding: 0;
	  margin: 0;
	  border: 0;
	  min-width: 0;
	}
	legend {
	  display: block;
	  width: 100%;
	  padding: 0;
	  margin-bottom: 18px;
	  font-size: 19.5px;
	  line-height: inherit;
	  color: #333333;
	  border: 0;
	  border-bottom: 1px solid #e5e5e5;
	}
	label {
	  display: inline-block;
	  max-width: 100%;
	  margin-bottom: 5px;
	  font-weight: bold;
	}
	input[type="search"] {
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	}
	input[type="radio"],
	input[type="checkbox"] {
	  margin: 4px 0 0;
	  margin-top: 1px \9;
	  line-height: normal;
	}
	input[type="file"] {
	  display: block;
	}
	input[type="range"] {
	  display: block;
	  width: 100%;
	}
	select[multiple],
	select[size] {
	  height: auto;
	}
	input[type="file"]:focus,
	input[type="radio"]:focus,
	input[type="checkbox"]:focus {
	  outline: 5px auto -webkit-focus-ring-color;
	  outline-offset: -2px;
	}
	output {
	  display: block;
	  padding-top: 7px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #555555;
	}
	.form-control {
	  display: block;
	  width: 100%;
	  height: 32px;
	  padding: 6px 12px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #555555;
	  background-color: #fff;
	  background-image: none;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	.form-control:focus {
	  border-color: #66afe9;
	  outline: 0;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	  box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	}
	.form-control::-moz-placeholder {
	  color: #999;
	  opacity: 1;
	}
	.form-control:-ms-input-placeholder {
	  color: #999;
	}
	.form-control::-webkit-input-placeholder {
	  color: #999;
	}
	.form-control::-ms-expand {
	  border: 0;
	  background-color: transparent;
	}
	.form-control[disabled],
	.form-control[readonly],
	fieldset[disabled] .form-control {
	  background-color: #eeeeee;
	  opacity: 1;
	}
	.form-control[disabled],
	fieldset[disabled] .form-control {
	  cursor: not-allowed;
	}
	textarea.form-control {
	  height: auto;
	}
	input[type="search"] {
	  -webkit-appearance: none;
	}
	@media screen and (-webkit-min-device-pixel-ratio: 0) {
	  input[type="date"].form-control,
	  input[type="time"].form-control,
	  input[type="datetime-local"].form-control,
	  input[type="month"].form-control {
	    line-height: 32px;
	  }
	  input[type="date"].input-sm,
	  input[type="time"].input-sm,
	  input[type="datetime-local"].input-sm,
	  input[type="month"].input-sm,
	  .input-group-sm input[type="date"],
	  .input-group-sm input[type="time"],
	  .input-group-sm input[type="datetime-local"],
	  .input-group-sm input[type="month"] {
	    line-height: 30px;
	  }
	  input[type="date"].input-lg,
	  input[type="time"].input-lg,
	  input[type="datetime-local"].input-lg,
	  input[type="month"].input-lg,
	  .input-group-lg input[type="date"],
	  .input-group-lg input[type="time"],
	  .input-group-lg input[type="datetime-local"],
	  .input-group-lg input[type="month"] {
	    line-height: 45px;
	  }
	}
	.form-group {
	  margin-bottom: 15px;
	}
	.radio,
	.checkbox {
	  position: relative;
	  display: block;
	  margin-top: 10px;
	  margin-bottom: 10px;
	}
	.radio label,
	.checkbox label {
	  min-height: 18px;
	  padding-left: 20px;
	  margin-bottom: 0;
	  font-weight: normal;
	  cursor: pointer;
	}
	.radio input[type="radio"],
	.radio-inline input[type="radio"],
	.checkbox input[type="checkbox"],
	.checkbox-inline input[type="checkbox"] {
	  position: absolute;
	  margin-left: -20px;
	  margin-top: 4px \9;
	}
	.radio + .radio,
	.checkbox + .checkbox {
	  margin-top: -5px;
	}
	.radio-inline,
	.checkbox-inline {
	  position: relative;
	  display: inline-block;
	  padding-left: 20px;
	  margin-bottom: 0;
	  vertical-align: middle;
	  font-weight: normal;
	  cursor: pointer;
	}
	.radio-inline + .radio-inline,
	.checkbox-inline + .checkbox-inline {
	  margin-top: 0;
	  margin-left: 10px;
	}
	input[type="radio"][disabled],
	input[type="checkbox"][disabled],
	input[type="radio"].disabled,
	input[type="checkbox"].disabled,
	fieldset[disabled] input[type="radio"],
	fieldset[disabled] input[type="checkbox"] {
	  cursor: not-allowed;
	}
	.radio-inline.disabled,
	.checkbox-inline.disabled,
	fieldset[disabled] .radio-inline,
	fieldset[disabled] .checkbox-inline {
	  cursor: not-allowed;
	}
	.radio.disabled label,
	.checkbox.disabled label,
	fieldset[disabled] .radio label,
	fieldset[disabled] .checkbox label {
	  cursor: not-allowed;
	}
	.form-control-static {
	  padding-top: 7px;
	  padding-bottom: 7px;
	  margin-bottom: 0;
	  min-height: 31px;
	}
	.form-control-static.input-lg,
	.form-control-static.input-sm {
	  padding-left: 0;
	  padding-right: 0;
	}
	.input-sm {
	  height: 30px;
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	}
	select.input-sm {
	  height: 30px;
	  line-height: 30px;
	}
	textarea.input-sm,
	select[multiple].input-sm {
	  height: auto;
	}
	.form-group-sm .form-control {
	  height: 30px;
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	}
	.form-group-sm select.form-control {
	  height: 30px;
	  line-height: 30px;
	}
	.form-group-sm textarea.form-control,
	.form-group-sm select[multiple].form-control {
	  height: auto;
	}
	.form-group-sm .form-control-static {
	  height: 30px;
	  min-height: 30px;
	  padding: 6px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	}
	.input-lg {
	  height: 45px;
	  padding: 10px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	  border-radius: 3px;
	}
	select.input-lg {
	  height: 45px;
	  line-height: 45px;
	}
	textarea.input-lg,
	select[multiple].input-lg {
	  height: auto;
	}
	.form-group-lg .form-control {
	  height: 45px;
	  padding: 10px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	  border-radius: 3px;
	}
	.form-group-lg select.form-control {
	  height: 45px;
	  line-height: 45px;
	}
	.form-group-lg textarea.form-control,
	.form-group-lg select[multiple].form-control {
	  height: auto;
	}
	.form-group-lg .form-control-static {
	  height: 45px;
	  min-height: 35px;
	  padding: 11px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	}
	.has-feedback {
	  position: relative;
	}
	.has-feedback .form-control {
	  padding-right: 40px;
	}
	.form-control-feedback {
	  position: absolute;
	  top: 0;
	  right: 0;
	  z-index: 2;
	  display: block;
	  width: 32px;
	  height: 32px;
	  line-height: 32px;
	  text-align: center;
	  pointer-events: none;
	}
	.input-lg + .form-control-feedback,
	.input-group-lg + .form-control-feedback,
	.form-group-lg .form-control + .form-control-feedback {
	  width: 45px;
	  height: 45px;
	  line-height: 45px;
	}
	.input-sm + .form-control-feedback,
	.input-group-sm + .form-control-feedback,
	.form-group-sm .form-control + .form-control-feedback {
	  width: 30px;
	  height: 30px;
	  line-height: 30px;
	}
	.has-success .help-block,
	.has-success .control-label,
	.has-success .radio,
	.has-success .checkbox,
	.has-success .radio-inline,
	.has-success .checkbox-inline,
	.has-success.radio label,
	.has-success.checkbox label,
	.has-success.radio-inline label,
	.has-success.checkbox-inline label {
	  color: #3c763d;
	}
	.has-success .form-control {
	  border-color: #3c763d;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	}
	.has-success .form-control:focus {
	  border-color: #2b542c;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #67b168;
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #67b168;
	}
	.has-success .input-group-addon {
	  color: #3c763d;
	  border-color: #3c763d;
	  background-color: #dff0d8;
	}
	.has-success .form-control-feedback {
	  color: #3c763d;
	}
	.has-warning .help-block,
	.has-warning .control-label,
	.has-warning .radio,
	.has-warning .checkbox,
	.has-warning .radio-inline,
	.has-warning .checkbox-inline,
	.has-warning.radio label,
	.has-warning.checkbox label,
	.has-warning.radio-inline label,
	.has-warning.checkbox-inline label {
	  color: #8a6d3b;
	}
	.has-warning .form-control {
	  border-color: #8a6d3b;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	}
	.has-warning .form-control:focus {
	  border-color: #66512c;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #c0a16b;
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #c0a16b;
	}
	.has-warning .input-group-addon {
	  color: #8a6d3b;
	  border-color: #8a6d3b;
	  background-color: #fcf8e3;
	}
	.has-warning .form-control-feedback {
	  color: #8a6d3b;
	}
	.has-error .help-block,
	.has-error .control-label,
	.has-error .radio,
	.has-error .checkbox,
	.has-error .radio-inline,
	.has-error .checkbox-inline,
	.has-error.radio label,
	.has-error.checkbox label,
	.has-error.radio-inline label,
	.has-error.checkbox-inline label {
	  color: #a94442;
	}
	.has-error .form-control {
	  border-color: #a94442;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	}
	.has-error .form-control:focus {
	  border-color: #843534;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #ce8483;
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #ce8483;
	}
	.has-error .input-group-addon {
	  color: #a94442;
	  border-color: #a94442;
	  background-color: #f2dede;
	}
	.has-error .form-control-feedback {
	  color: #a94442;
	}
	.has-feedback label ~ .form-control-feedback {
	  top: 23px;
	}
	.has-feedback label.sr-only ~ .form-control-feedback {
	  top: 0;
	}
	.help-block {
	  display: block;
	  margin-top: 5px;
	  margin-bottom: 10px;
	  color: #404040;
	}
	@media (min-width: 768px) {
	  .form-inline .form-group {
	    display: inline-block;
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .form-inline .form-control {
	    display: inline-block;
	    width: auto;
	    vertical-align: middle;
	  }
	  .form-inline .form-control-static {
	    display: inline-block;
	  }
	  .form-inline .input-group {
	    display: inline-table;
	    vertical-align: middle;
	  }
	  .form-inline .input-group .input-group-addon,
	  .form-inline .input-group .input-group-btn,
	  .form-inline .input-group .form-control {
	    width: auto;
	  }
	  .form-inline .input-group > .form-control {
	    width: 100%;
	  }
	  .form-inline .control-label {
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .form-inline .radio,
	  .form-inline .checkbox {
	    display: inline-block;
	    margin-top: 0;
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .form-inline .radio label,
	  .form-inline .checkbox label {
	    padding-left: 0;
	  }
	  .form-inline .radio input[type="radio"],
	  .form-inline .checkbox input[type="checkbox"] {
	    position: relative;
	    margin-left: 0;
	  }
	  .form-inline .has-feedback .form-control-feedback {
	    top: 0;
	  }
	}
	.form-horizontal .radio,
	.form-horizontal .checkbox,
	.form-horizontal .radio-inline,
	.form-horizontal .checkbox-inline {
	  margin-top: 0;
	  margin-bottom: 0;
	  padding-top: 7px;
	}
	.form-horizontal .radio,
	.form-horizontal .checkbox {
	  min-height: 25px;
	}
	.form-horizontal .form-group {
	  margin-left: 0px;
	  margin-right: 0px;
	}
	@media (min-width: 768px) {
	  .form-horizontal .control-label {
	    text-align: right;
	    margin-bottom: 0;
	    padding-top: 7px;
	  }
	}
	.form-horizontal .has-feedback .form-control-feedback {
	  right: 0px;
	}
	@media (min-width: 768px) {
	  .form-horizontal .form-group-lg .control-label {
	    padding-top: 11px;
	    font-size: 17px;
	  }
	}
	@media (min-width: 768px) {
	  .form-horizontal .form-group-sm .control-label {
	    padding-top: 6px;
	    font-size: 12px;
	  }
	}
	.btn {
	  display: inline-block;
	  margin-bottom: 0;
	  font-weight: normal;
	  text-align: center;
	  vertical-align: middle;
	  touch-action: manipulation;
	  cursor: pointer;
	  background-image: none;
	  border: 1px solid transparent;
	  white-space: nowrap;
	  padding: 6px 12px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  border-radius: 2px;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	.btn:focus,
	.btn:active:focus,
	.btn.active:focus,
	.btn.focus,
	.btn:active.focus,
	.btn.active.focus {
	  outline: 5px auto -webkit-focus-ring-color;
	  outline-offset: -2px;
	}
	.btn:hover,
	.btn:focus,
	.btn.focus {
	  color: #333;
	  text-decoration: none;
	}
	.btn:active,
	.btn.active {
	  outline: 0;
	  background-image: none;
	  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	}
	.btn.disabled,
	.btn[disabled],
	fieldset[disabled] .btn {
	  cursor: not-allowed;
	  opacity: 0.65;
	  filter: alpha(opacity=65);
	  -webkit-box-shadow: none;
	  box-shadow: none;
	}
	a.btn.disabled,
	fieldset[disabled] a.btn {
	  pointer-events: none;
	}
	.btn-default {
	  color: #333;
	  background-color: #fff;
	  border-color: #ccc;
	}
	.btn-default:focus,
	.btn-default.focus {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #8c8c8c;
	}
	.btn-default:hover {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.btn-default:active,
	.btn-default.active,
	.open > .dropdown-toggle.btn-default {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.btn-default:active:hover,
	.btn-default.active:hover,
	.open > .dropdown-toggle.btn-default:hover,
	.btn-default:active:focus,
	.btn-default.active:focus,
	.open > .dropdown-toggle.btn-default:focus,
	.btn-default:active.focus,
	.btn-default.active.focus,
	.open > .dropdown-toggle.btn-default.focus {
	  color: #333;
	  background-color: #d4d4d4;
	  border-color: #8c8c8c;
	}
	.btn-default:active,
	.btn-default.active,
	.open > .dropdown-toggle.btn-default {
	  background-image: none;
	}
	.btn-default.disabled:hover,
	.btn-default[disabled]:hover,
	fieldset[disabled] .btn-default:hover,
	.btn-default.disabled:focus,
	.btn-default[disabled]:focus,
	fieldset[disabled] .btn-default:focus,
	.btn-default.disabled.focus,
	.btn-default[disabled].focus,
	fieldset[disabled] .btn-default.focus {
	  background-color: #fff;
	  border-color: #ccc;
	}
	.btn-default .badge {
	  color: #fff;
	  background-color: #333;
	}
	.btn-primary {
	  color: #fff;
	  background-color: #337ab7;
	  border-color: #2e6da4;
	}
	.btn-primary:focus,
	.btn-primary.focus {
	  color: #fff;
	  background-color: #286090;
	  border-color: #122b40;
	}
	.btn-primary:hover {
	  color: #fff;
	  background-color: #286090;
	  border-color: #204d74;
	}
	.btn-primary:active,
	.btn-primary.active,
	.open > .dropdown-toggle.btn-primary {
	  color: #fff;
	  background-color: #286090;
	  border-color: #204d74;
	}
	.btn-primary:active:hover,
	.btn-primary.active:hover,
	.open > .dropdown-toggle.btn-primary:hover,
	.btn-primary:active:focus,
	.btn-primary.active:focus,
	.open > .dropdown-toggle.btn-primary:focus,
	.btn-primary:active.focus,
	.btn-primary.active.focus,
	.open > .dropdown-toggle.btn-primary.focus {
	  color: #fff;
	  background-color: #204d74;
	  border-color: #122b40;
	}
	.btn-primary:active,
	.btn-primary.active,
	.open > .dropdown-toggle.btn-primary {
	  background-image: none;
	}
	.btn-primary.disabled:hover,
	.btn-primary[disabled]:hover,
	fieldset[disabled] .btn-primary:hover,
	.btn-primary.disabled:focus,
	.btn-primary[disabled]:focus,
	fieldset[disabled] .btn-primary:focus,
	.btn-primary.disabled.focus,
	.btn-primary[disabled].focus,
	fieldset[disabled] .btn-primary.focus {
	  background-color: #337ab7;
	  border-color: #2e6da4;
	}
	.btn-primary .badge {
	  color: #337ab7;
	  background-color: #fff;
	}
	.btn-success {
	  color: #fff;
	  background-color: #5cb85c;
	  border-color: #4cae4c;
	}
	.btn-success:focus,
	.btn-success.focus {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #255625;
	}
	.btn-success:hover {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #398439;
	}
	.btn-success:active,
	.btn-success.active,
	.open > .dropdown-toggle.btn-success {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #398439;
	}
	.btn-success:active:hover,
	.btn-success.active:hover,
	.open > .dropdown-toggle.btn-success:hover,
	.btn-success:active:focus,
	.btn-success.active:focus,
	.open > .dropdown-toggle.btn-success:focus,
	.btn-success:active.focus,
	.btn-success.active.focus,
	.open > .dropdown-toggle.btn-success.focus {
	  color: #fff;
	  background-color: #398439;
	  border-color: #255625;
	}
	.btn-success:active,
	.btn-success.active,
	.open > .dropdown-toggle.btn-success {
	  background-image: none;
	}
	.btn-success.disabled:hover,
	.btn-success[disabled]:hover,
	fieldset[disabled] .btn-success:hover,
	.btn-success.disabled:focus,
	.btn-success[disabled]:focus,
	fieldset[disabled] .btn-success:focus,
	.btn-success.disabled.focus,
	.btn-success[disabled].focus,
	fieldset[disabled] .btn-success.focus {
	  background-color: #5cb85c;
	  border-color: #4cae4c;
	}
	.btn-success .badge {
	  color: #5cb85c;
	  background-color: #fff;
	}
	.btn-info {
	  color: #fff;
	  background-color: #5bc0de;
	  border-color: #46b8da;
	}
	.btn-info:focus,
	.btn-info.focus {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #1b6d85;
	}
	.btn-info:hover {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #269abc;
	}
	.btn-info:active,
	.btn-info.active,
	.open > .dropdown-toggle.btn-info {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #269abc;
	}
	.btn-info:active:hover,
	.btn-info.active:hover,
	.open > .dropdown-toggle.btn-info:hover,
	.btn-info:active:focus,
	.btn-info.active:focus,
	.open > .dropdown-toggle.btn-info:focus,
	.btn-info:active.focus,
	.btn-info.active.focus,
	.open > .dropdown-toggle.btn-info.focus {
	  color: #fff;
	  background-color: #269abc;
	  border-color: #1b6d85;
	}
	.btn-info:active,
	.btn-info.active,
	.open > .dropdown-toggle.btn-info {
	  background-image: none;
	}
	.btn-info.disabled:hover,
	.btn-info[disabled]:hover,
	fieldset[disabled] .btn-info:hover,
	.btn-info.disabled:focus,
	.btn-info[disabled]:focus,
	fieldset[disabled] .btn-info:focus,
	.btn-info.disabled.focus,
	.btn-info[disabled].focus,
	fieldset[disabled] .btn-info.focus {
	  background-color: #5bc0de;
	  border-color: #46b8da;
	}
	.btn-info .badge {
	  color: #5bc0de;
	  background-color: #fff;
	}
	.btn-warning {
	  color: #fff;
	  background-color: #f0ad4e;
	  border-color: #eea236;
	}
	.btn-warning:focus,
	.btn-warning.focus {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #985f0d;
	}
	.btn-warning:hover {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #d58512;
	}
	.btn-warning:active,
	.btn-warning.active,
	.open > .dropdown-toggle.btn-warning {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #d58512;
	}
	.btn-warning:active:hover,
	.btn-warning.active:hover,
	.open > .dropdown-toggle.btn-warning:hover,
	.btn-warning:active:focus,
	.btn-warning.active:focus,
	.open > .dropdown-toggle.btn-warning:focus,
	.btn-warning:active.focus,
	.btn-warning.active.focus,
	.open > .dropdown-toggle.btn-warning.focus {
	  color: #fff;
	  background-color: #d58512;
	  border-color: #985f0d;
	}
	.btn-warning:active,
	.btn-warning.active,
	.open > .dropdown-toggle.btn-warning {
	  background-image: none;
	}
	.btn-warning.disabled:hover,
	.btn-warning[disabled]:hover,
	fieldset[disabled] .btn-warning:hover,
	.btn-warning.disabled:focus,
	.btn-warning[disabled]:focus,
	fieldset[disabled] .btn-warning:focus,
	.btn-warning.disabled.focus,
	.btn-warning[disabled].focus,
	fieldset[disabled] .btn-warning.focus {
	  background-color: #f0ad4e;
	  border-color: #eea236;
	}
	.btn-warning .badge {
	  color: #f0ad4e;
	  background-color: #fff;
	}
	.btn-danger {
	  color: #fff;
	  background-color: #d9534f;
	  border-color: #d43f3a;
	}
	.btn-danger:focus,
	.btn-danger.focus {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #761c19;
	}
	.btn-danger:hover {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #ac2925;
	}
	.btn-danger:active,
	.btn-danger.active,
	.open > .dropdown-toggle.btn-danger {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #ac2925;
	}
	.btn-danger:active:hover,
	.btn-danger.active:hover,
	.open > .dropdown-toggle.btn-danger:hover,
	.btn-danger:active:focus,
	.btn-danger.active:focus,
	.open > .dropdown-toggle.btn-danger:focus,
	.btn-danger:active.focus,
	.btn-danger.active.focus,
	.open > .dropdown-toggle.btn-danger.focus {
	  color: #fff;
	  background-color: #ac2925;
	  border-color: #761c19;
	}
	.btn-danger:active,
	.btn-danger.active,
	.open > .dropdown-toggle.btn-danger {
	  background-image: none;
	}
	.btn-danger.disabled:hover,
	.btn-danger[disabled]:hover,
	fieldset[disabled] .btn-danger:hover,
	.btn-danger.disabled:focus,
	.btn-danger[disabled]:focus,
	fieldset[disabled] .btn-danger:focus,
	.btn-danger.disabled.focus,
	.btn-danger[disabled].focus,
	fieldset[disabled] .btn-danger.focus {
	  background-color: #d9534f;
	  border-color: #d43f3a;
	}
	.btn-danger .badge {
	  color: #d9534f;
	  background-color: #fff;
	}
	.btn-link {
	  color: #337ab7;
	  font-weight: normal;
	  border-radius: 0;
	}
	.btn-link,
	.btn-link:active,
	.btn-link.active,
	.btn-link[disabled],
	fieldset[disabled] .btn-link {
	  background-color: transparent;
	  -webkit-box-shadow: none;
	  box-shadow: none;
	}
	.btn-link,
	.btn-link:hover,
	.btn-link:focus,
	.btn-link:active {
	  border-color: transparent;
	}
	.btn-link:hover,
	.btn-link:focus {
	  color: #23527c;
	  text-decoration: underline;
	  background-color: transparent;
	}
	.btn-link[disabled]:hover,
	fieldset[disabled] .btn-link:hover,
	.btn-link[disabled]:focus,
	fieldset[disabled] .btn-link:focus {
	  color: #777777;
	  text-decoration: none;
	}
	.btn-lg,
	.btn-group-lg > .btn {
	  padding: 10px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	  border-radius: 3px;
	}
	.btn-sm,
	.btn-group-sm > .btn {
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	}
	.btn-xs,
	.btn-group-xs > .btn {
	  padding: 1px 5px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	}
	.btn-block {
	  display: block;
	  width: 100%;
	}
	.btn-block + .btn-block {
	  margin-top: 5px;
	}
	input[type="submit"].btn-block,
	input[type="reset"].btn-block,
	input[type="button"].btn-block {
	  width: 100%;
	}
	.fade {
	  opacity: 0;
	  -webkit-transition: opacity 0.15s linear;
	  -o-transition: opacity 0.15s linear;
	  transition: opacity 0.15s linear;
	}
	.fade.in {
	  opacity: 1;
	}
	.collapse {
	  display: none;
	}
	.collapse.in {
	  display: block;
	}
	tr.collapse.in {
	  display: table-row;
	}
	tbody.collapse.in {
	  display: table-row-group;
	}
	.collapsing {
	  position: relative;
	  height: 0;
	  overflow: hidden;
	  -webkit-transition-property: height, visibility;
	  transition-property: height, visibility;
	  -webkit-transition-duration: 0.35s;
	  transition-duration: 0.35s;
	  -webkit-transition-timing-function: ease;
	  transition-timing-function: ease;
	}
	.caret {
	  display: inline-block;
	  width: 0;
	  height: 0;
	  margin-left: 2px;
	  vertical-align: middle;
	  border-top: 4px dashed;
	  border-top: 4px solid \9;
	  border-right: 4px solid transparent;
	  border-left: 4px solid transparent;
	}
	.dropup,
	.dropdown {
	  position: relative;
	}
	.dropdown-toggle:focus {
	  outline: 0;
	}
	.dropdown-menu {
	  position: absolute;
	  top: 100%;
	  left: 0;
	  z-index: 1000;
	  display: none;
	  float: left;
	  min-width: 160px;
	  padding: 5px 0;
	  margin: 2px 0 0;
	  list-style: none;
	  font-size: 13px;
	  text-align: left;
	  background-color: #fff;
	  border: 1px solid #ccc;
	  border: 1px solid rgba(0, 0, 0, 0.15);
	  border-radius: 2px;
	  -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	  background-clip: padding-box;
	}
	.dropdown-menu.pull-right {
	  right: 0;
	  left: auto;
	}
	.dropdown-menu .divider {
	  height: 1px;
	  margin: 8px 0;
	  overflow: hidden;
	  background-color: #e5e5e5;
	}
	.dropdown-menu > li > a {
	  display: block;
	  padding: 3px 20px;
	  clear: both;
	  font-weight: normal;
	  line-height: 1.42857143;
	  color: #333333;
	  white-space: nowrap;
	}
	.dropdown-menu > li > a:hover,
	.dropdown-menu > li > a:focus {
	  text-decoration: none;
	  color: #262626;
	  background-color: #f5f5f5;
	}
	.dropdown-menu > .active > a,
	.dropdown-menu > .active > a:hover,
	.dropdown-menu > .active > a:focus {
	  color: #fff;
	  text-decoration: none;
	  outline: 0;
	  background-color: #337ab7;
	}
	.dropdown-menu > .disabled > a,
	.dropdown-menu > .disabled > a:hover,
	.dropdown-menu > .disabled > a:focus {
	  color: #777777;
	}
	.dropdown-menu > .disabled > a:hover,
	.dropdown-menu > .disabled > a:focus {
	  text-decoration: none;
	  background-color: transparent;
	  background-image: none;
	  filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
	  cursor: not-allowed;
	}
	.open > .dropdown-menu {
	  display: block;
	}
	.open > a {
	  outline: 0;
	}
	.dropdown-menu-right {
	  left: auto;
	  right: 0;
	}
	.dropdown-menu-left {
	  left: 0;
	  right: auto;
	}
	.dropdown-header {
	  display: block;
	  padding: 3px 20px;
	  font-size: 12px;
	  line-height: 1.42857143;
	  color: #777777;
	  white-space: nowrap;
	}
	.dropdown-backdrop {
	  position: fixed;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  top: 0;
	  z-index: 990;
	}
	.pull-right > .dropdown-menu {
	  right: 0;
	  left: auto;
	}
	.dropup .caret,
	.navbar-fixed-bottom .dropdown .caret {
	  border-top: 0;
	  border-bottom: 4px dashed;
	  border-bottom: 4px solid \9;
	  content: "";
	}
	.dropup .dropdown-menu,
	.navbar-fixed-bottom .dropdown .dropdown-menu {
	  top: auto;
	  bottom: 100%;
	  margin-bottom: 2px;
	}
	@media (min-width: 541px) {
	  .navbar-right .dropdown-menu {
	    left: auto;
	    right: 0;
	  }
	  .navbar-right .dropdown-menu-left {
	    left: 0;
	    right: auto;
	  }
	}
	.btn-group,
	.btn-group-vertical {
	  position: relative;
	  display: inline-block;
	  vertical-align: middle;
	}
	.btn-group > .btn,
	.btn-group-vertical > .btn {
	  position: relative;
	  float: left;
	}
	.btn-group > .btn:hover,
	.btn-group-vertical > .btn:hover,
	.btn-group > .btn:focus,
	.btn-group-vertical > .btn:focus,
	.btn-group > .btn:active,
	.btn-group-vertical > .btn:active,
	.btn-group > .btn.active,
	.btn-group-vertical > .btn.active {
	  z-index: 2;
	}
	.btn-group .btn + .btn,
	.btn-group .btn + .btn-group,
	.btn-group .btn-group + .btn,
	.btn-group .btn-group + .btn-group {
	  margin-left: -1px;
	}
	.btn-toolbar {
	  margin-left: -5px;
	}
	.btn-toolbar .btn,
	.btn-toolbar .btn-group,
	.btn-toolbar .input-group {
	  float: left;
	}
	.btn-toolbar > .btn,
	.btn-toolbar > .btn-group,
	.btn-toolbar > .input-group {
	  margin-left: 5px;
	}
	.btn-group > .btn:not(:first-child):not(:last-child):not(.dropdown-toggle) {
	  border-radius: 0;
	}
	.btn-group > .btn:first-child {
	  margin-left: 0;
	}
	.btn-group > .btn:first-child:not(:last-child):not(.dropdown-toggle) {
	  border-bottom-right-radius: 0;
	  border-top-right-radius: 0;
	}
	.btn-group > .btn:last-child:not(:first-child),
	.btn-group > .dropdown-toggle:not(:first-child) {
	  border-bottom-left-radius: 0;
	  border-top-left-radius: 0;
	}
	.btn-group > .btn-group {
	  float: left;
	}
	.btn-group > .btn-group:not(:first-child):not(:last-child) > .btn {
	  border-radius: 0;
	}
	.btn-group > .btn-group:first-child:not(:last-child) > .btn:last-child,
	.btn-group > .btn-group:first-child:not(:last-child) > .dropdown-toggle {
	  border-bottom-right-radius: 0;
	  border-top-right-radius: 0;
	}
	.btn-group > .btn-group:last-child:not(:first-child) > .btn:first-child {
	  border-bottom-left-radius: 0;
	  border-top-left-radius: 0;
	}
	.btn-group .dropdown-toggle:active,
	.btn-group.open .dropdown-toggle {
	  outline: 0;
	}
	.btn-group > .btn + .dropdown-toggle {
	  padding-left: 8px;
	  padding-right: 8px;
	}
	.btn-group > .btn-lg + .dropdown-toggle {
	  padding-left: 12px;
	  padding-right: 12px;
	}
	.btn-group.open .dropdown-toggle {
	  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	}
	.btn-group.open .dropdown-toggle.btn-link {
	  -webkit-box-shadow: none;
	  box-shadow: none;
	}
	.btn .caret {
	  margin-left: 0;
	}
	.btn-lg .caret {
	  border-width: 5px 5px 0;
	  border-bottom-width: 0;
	}
	.dropup .btn-lg .caret {
	  border-width: 0 5px 5px;
	}
	.btn-group-vertical > .btn,
	.btn-group-vertical > .btn-group,
	.btn-group-vertical > .btn-group > .btn {
	  display: block;
	  float: none;
	  width: 100%;
	  max-width: 100%;
	}
	.btn-group-vertical > .btn-group > .btn {
	  float: none;
	}
	.btn-group-vertical > .btn + .btn,
	.btn-group-vertical > .btn + .btn-group,
	.btn-group-vertical > .btn-group + .btn,
	.btn-group-vertical > .btn-group + .btn-group {
	  margin-top: -1px;
	  margin-left: 0;
	}
	.btn-group-vertical > .btn:not(:first-child):not(:last-child) {
	  border-radius: 0;
	}
	.btn-group-vertical > .btn:first-child:not(:last-child) {
	  border-top-right-radius: 2px;
	  border-top-left-radius: 2px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.btn-group-vertical > .btn:last-child:not(:first-child) {
	  border-top-right-radius: 0;
	  border-top-left-radius: 0;
	  border-bottom-right-radius: 2px;
	  border-bottom-left-radius: 2px;
	}
	.btn-group-vertical > .btn-group:not(:first-child):not(:last-child) > .btn {
	  border-radius: 0;
	}
	.btn-group-vertical > .btn-group:first-child:not(:last-child) > .btn:last-child,
	.btn-group-vertical > .btn-group:first-child:not(:last-child) > .dropdown-toggle {
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.btn-group-vertical > .btn-group:last-child:not(:first-child) > .btn:first-child {
	  border-top-right-radius: 0;
	  border-top-left-radius: 0;
	}
	.btn-group-justified {
	  display: table;
	  width: 100%;
	  table-layout: fixed;
	  border-collapse: separate;
	}
	.btn-group-justified > .btn,
	.btn-group-justified > .btn-group {
	  float: none;
	  display: table-cell;
	  width: 1%;
	}
	.btn-group-justified > .btn-group .btn {
	  width: 100%;
	}
	.btn-group-justified > .btn-group .dropdown-menu {
	  left: auto;
	}
	[data-toggle="buttons"] > .btn input[type="radio"],
	[data-toggle="buttons"] > .btn-group > .btn input[type="radio"],
	[data-toggle="buttons"] > .btn input[type="checkbox"],
	[data-toggle="buttons"] > .btn-group > .btn input[type="checkbox"] {
	  position: absolute;
	  clip: rect(0, 0, 0, 0);
	  pointer-events: none;
	}
	.input-group {
	  position: relative;
	  display: table;
	  border-collapse: separate;
	}
	.input-group[class*="col-"] {
	  float: none;
	  padding-left: 0;
	  padding-right: 0;
	}
	.input-group .form-control {
	  position: relative;
	  z-index: 2;
	  float: left;
	  width: 100%;
	  margin-bottom: 0;
	}
	.input-group .form-control:focus {
	  z-index: 3;
	}
	.input-group-lg > .form-control,
	.input-group-lg > .input-group-addon,
	.input-group-lg > .input-group-btn > .btn {
	  height: 45px;
	  padding: 10px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	  border-radius: 3px;
	}
	select.input-group-lg > .form-control,
	select.input-group-lg > .input-group-addon,
	select.input-group-lg > .input-group-btn > .btn {
	  height: 45px;
	  line-height: 45px;
	}
	textarea.input-group-lg > .form-control,
	textarea.input-group-lg > .input-group-addon,
	textarea.input-group-lg > .input-group-btn > .btn,
	select[multiple].input-group-lg > .form-control,
	select[multiple].input-group-lg > .input-group-addon,
	select[multiple].input-group-lg > .input-group-btn > .btn {
	  height: auto;
	}
	.input-group-sm > .form-control,
	.input-group-sm > .input-group-addon,
	.input-group-sm > .input-group-btn > .btn {
	  height: 30px;
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	}
	select.input-group-sm > .form-control,
	select.input-group-sm > .input-group-addon,
	select.input-group-sm > .input-group-btn > .btn {
	  height: 30px;
	  line-height: 30px;
	}
	textarea.input-group-sm > .form-control,
	textarea.input-group-sm > .input-group-addon,
	textarea.input-group-sm > .input-group-btn > .btn,
	select[multiple].input-group-sm > .form-control,
	select[multiple].input-group-sm > .input-group-addon,
	select[multiple].input-group-sm > .input-group-btn > .btn {
	  height: auto;
	}
	.input-group-addon,
	.input-group-btn,
	.input-group .form-control {
	  display: table-cell;
	}
	.input-group-addon:not(:first-child):not(:last-child),
	.input-group-btn:not(:first-child):not(:last-child),
	.input-group .form-control:not(:first-child):not(:last-child) {
	  border-radius: 0;
	}
	.input-group-addon,
	.input-group-btn {
	  width: 1%;
	  white-space: nowrap;
	  vertical-align: middle;
	}
	.input-group-addon {
	  padding: 6px 12px;
	  font-size: 13px;
	  font-weight: normal;
	  line-height: 1;
	  color: #555555;
	  text-align: center;
	  background-color: #eeeeee;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	}
	.input-group-addon.input-sm {
	  padding: 5px 10px;
	  font-size: 12px;
	  border-radius: 1px;
	}
	.input-group-addon.input-lg {
	  padding: 10px 16px;
	  font-size: 17px;
	  border-radius: 3px;
	}
	.input-group-addon input[type="radio"],
	.input-group-addon input[type="checkbox"] {
	  margin-top: 0;
	}
	.input-group .form-control:first-child,
	.input-group-addon:first-child,
	.input-group-btn:first-child > .btn,
	.input-group-btn:first-child > .btn-group > .btn,
	.input-group-btn:first-child > .dropdown-toggle,
	.input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle),
	.input-group-btn:last-child > .btn-group:not(:last-child) > .btn {
	  border-bottom-right-radius: 0;
	  border-top-right-radius: 0;
	}
	.input-group-addon:first-child {
	  border-right: 0;
	}
	.input-group .form-control:last-child,
	.input-group-addon:last-child,
	.input-group-btn:last-child > .btn,
	.input-group-btn:last-child > .btn-group > .btn,
	.input-group-btn:last-child > .dropdown-toggle,
	.input-group-btn:first-child > .btn:not(:first-child),
	.input-group-btn:first-child > .btn-group:not(:first-child) > .btn {
	  border-bottom-left-radius: 0;
	  border-top-left-radius: 0;
	}
	.input-group-addon:last-child {
	  border-left: 0;
	}
	.input-group-btn {
	  position: relative;
	  font-size: 0;
	  white-space: nowrap;
	}
	.input-group-btn > .btn {
	  position: relative;
	}
	.input-group-btn > .btn + .btn {
	  margin-left: -1px;
	}
	.input-group-btn > .btn:hover,
	.input-group-btn > .btn:focus,
	.input-group-btn > .btn:active {
	  z-index: 2;
	}
	.input-group-btn:first-child > .btn,
	.input-group-btn:first-child > .btn-group {
	  margin-right: -1px;
	}
	.input-group-btn:last-child > .btn,
	.input-group-btn:last-child > .btn-group {
	  z-index: 2;
	  margin-left: -1px;
	}
	.nav {
	  margin-bottom: 0;
	  padding-left: 0;
	  list-style: none;
	}
	.nav > li {
	  position: relative;
	  display: block;
	}
	.nav > li > a {
	  position: relative;
	  display: block;
	  padding: 10px 15px;
	}
	.nav > li > a:hover,
	.nav > li > a:focus {
	  text-decoration: none;
	  background-color: #eeeeee;
	}
	.nav > li.disabled > a {
	  color: #777777;
	}
	.nav > li.disabled > a:hover,
	.nav > li.disabled > a:focus {
	  color: #777777;
	  text-decoration: none;
	  background-color: transparent;
	  cursor: not-allowed;
	}
	.nav .open > a,
	.nav .open > a:hover,
	.nav .open > a:focus {
	  background-color: #eeeeee;
	  border-color: #337ab7;
	}
	.nav .nav-divider {
	  height: 1px;
	  margin: 8px 0;
	  overflow: hidden;
	  background-color: #e5e5e5;
	}
	.nav > li > a > img {
	  max-width: none;
	}
	.nav-tabs {
	  border-bottom: 1px solid #ddd;
	}
	.nav-tabs > li {
	  float: left;
	  margin-bottom: -1px;
	}
	.nav-tabs > li > a {
	  margin-right: 2px;
	  line-height: 1.42857143;
	  border: 1px solid transparent;
	  border-radius: 2px 2px 0 0;
	}
	.nav-tabs > li > a:hover {
	  border-color: #eeeeee #eeeeee #ddd;
	}
	.nav-tabs > li.active > a,
	.nav-tabs > li.active > a:hover,
	.nav-tabs > li.active > a:focus {
	  color: #555555;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  border-bottom-color: transparent;
	  cursor: default;
	}
	.nav-tabs.nav-justified {
	  width: 100%;
	  border-bottom: 0;
	}
	.nav-tabs.nav-justified > li {
	  float: none;
	}
	.nav-tabs.nav-justified > li > a {
	  text-align: center;
	  margin-bottom: 5px;
	}
	.nav-tabs.nav-justified > .dropdown .dropdown-menu {
	  top: auto;
	  left: auto;
	}
	@media (min-width: 768px) {
	  .nav-tabs.nav-justified > li {
	    display: table-cell;
	    width: 1%;
	  }
	  .nav-tabs.nav-justified > li > a {
	    margin-bottom: 0;
	  }
	}
	.nav-tabs.nav-justified > li > a {
	  margin-right: 0;
	  border-radius: 2px;
	}
	.nav-tabs.nav-justified > .active > a,
	.nav-tabs.nav-justified > .active > a:hover,
	.nav-tabs.nav-justified > .active > a:focus {
	  border: 1px solid #ddd;
	}
	@media (min-width: 768px) {
	  .nav-tabs.nav-justified > li > a {
	    border-bottom: 1px solid #ddd;
	    border-radius: 2px 2px 0 0;
	  }
	  .nav-tabs.nav-justified > .active > a,
	  .nav-tabs.nav-justified > .active > a:hover,
	  .nav-tabs.nav-justified > .active > a:focus {
	    border-bottom-color: #fff;
	  }
	}
	.nav-pills > li {
	  float: left;
	}
	.nav-pills > li > a {
	  border-radius: 2px;
	}
	.nav-pills > li + li {
	  margin-left: 2px;
	}
	.nav-pills > li.active > a,
	.nav-pills > li.active > a:hover,
	.nav-pills > li.active > a:focus {
	  color: #fff;
	  background-color: #337ab7;
	}
	.nav-stacked > li {
	  float: none;
	}
	.nav-stacked > li + li {
	  margin-top: 2px;
	  margin-left: 0;
	}
	.nav-justified {
	  width: 100%;
	}
	.nav-justified > li {
	  float: none;
	}
	.nav-justified > li > a {
	  text-align: center;
	  margin-bottom: 5px;
	}
	.nav-justified > .dropdown .dropdown-menu {
	  top: auto;
	  left: auto;
	}
	@media (min-width: 768px) {
	  .nav-justified > li {
	    display: table-cell;
	    width: 1%;
	  }
	  .nav-justified > li > a {
	    margin-bottom: 0;
	  }
	}
	.nav-tabs-justified {
	  border-bottom: 0;
	}
	.nav-tabs-justified > li > a {
	  margin-right: 0;
	  border-radius: 2px;
	}
	.nav-tabs-justified > .active > a,
	.nav-tabs-justified > .active > a:hover,
	.nav-tabs-justified > .active > a:focus {
	  border: 1px solid #ddd;
	}
	@media (min-width: 768px) {
	  .nav-tabs-justified > li > a {
	    border-bottom: 1px solid #ddd;
	    border-radius: 2px 2px 0 0;
	  }
	  .nav-tabs-justified > .active > a,
	  .nav-tabs-justified > .active > a:hover,
	  .nav-tabs-justified > .active > a:focus {
	    border-bottom-color: #fff;
	  }
	}
	.tab-content > .tab-pane {
	  display: none;
	}
	.tab-content > .active {
	  display: block;
	}
	.nav-tabs .dropdown-menu {
	  margin-top: -1px;
	  border-top-right-radius: 0;
	  border-top-left-radius: 0;
	}
	.navbar {
	  position: relative;
	  min-height: 30px;
	  margin-bottom: 18px;
	  border: 1px solid transparent;
	}
	@media (min-width: 541px) {
	  .navbar {
	    border-radius: 2px;
	  }
	}
	@media (min-width: 541px) {
	  .navbar-header {
	    float: left;
	  }
	}
	.navbar-collapse {
	  overflow-x: visible;
	  padding-right: 0px;
	  padding-left: 0px;
	  border-top: 1px solid transparent;
	  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
	  -webkit-overflow-scrolling: touch;
	}
	.navbar-collapse.in {
	  overflow-y: auto;
	}
	@media (min-width: 541px) {
	  .navbar-collapse {
	    width: auto;
	    border-top: 0;
	    box-shadow: none;
	  }
	  .navbar-collapse.collapse {
	    display: block !important;
	    height: auto !important;
	    padding-bottom: 0;
	    overflow: visible !important;
	  }
	  .navbar-collapse.in {
	    overflow-y: visible;
	  }
	  .navbar-fixed-top .navbar-collapse,
	  .navbar-static-top .navbar-collapse,
	  .navbar-fixed-bottom .navbar-collapse {
	    padding-left: 0;
	    padding-right: 0;
	  }
	}
	.navbar-fixed-top .navbar-collapse,
	.navbar-fixed-bottom .navbar-collapse {
	  max-height: 340px;
	}
	@media (max-device-width: 540px) and (orientation: landscape) {
	  .navbar-fixed-top .navbar-collapse,
	  .navbar-fixed-bottom .navbar-collapse {
	    max-height: 200px;
	  }
	}
	.container > .navbar-header,
	.container-fluid > .navbar-header,
	.container > .navbar-collapse,
	.container-fluid > .navbar-collapse {
	  margin-right: 0px;
	  margin-left: 0px;
	}
	@media (min-width: 541px) {
	  .container > .navbar-header,
	  .container-fluid > .navbar-header,
	  .container > .navbar-collapse,
	  .container-fluid > .navbar-collapse {
	    margin-right: 0;
	    margin-left: 0;
	  }
	}
	.navbar-static-top {
	  z-index: 1000;
	  border-width: 0 0 1px;
	}
	@media (min-width: 541px) {
	  .navbar-static-top {
	    border-radius: 0;
	  }
	}
	.navbar-fixed-top,
	.navbar-fixed-bottom {
	  position: fixed;
	  right: 0;
	  left: 0;
	  z-index: 1030;
	}
	@media (min-width: 541px) {
	  .navbar-fixed-top,
	  .navbar-fixed-bottom {
	    border-radius: 0;
	  }
	}
	.navbar-fixed-top {
	  top: 0;
	  border-width: 0 0 1px;
	}
	.navbar-fixed-bottom {
	  bottom: 0;
	  margin-bottom: 0;
	  border-width: 1px 0 0;
	}
	.navbar-brand {
	  float: left;
	  padding: 6px 0px;
	  font-size: 17px;
	  line-height: 18px;
	  height: 30px;
	}
	.navbar-brand:hover,
	.navbar-brand:focus {
	  text-decoration: none;
	}
	.navbar-brand > img {
	  display: block;
	}
	@media (min-width: 541px) {
	  .navbar > .container .navbar-brand,
	  .navbar > .container-fluid .navbar-brand {
	    margin-left: 0px;
	  }
	}
	.navbar-toggle {
	  position: relative;
	  float: right;
	  margin-right: 0px;
	  padding: 9px 10px;
	  margin-top: -2px;
	  margin-bottom: -2px;
	  background-color: transparent;
	  background-image: none;
	  border: 1px solid transparent;
	  border-radius: 2px;
	}
	.navbar-toggle:focus {
	  outline: 0;
	}
	.navbar-toggle .icon-bar {
	  display: block;
	  width: 22px;
	  height: 2px;
	  border-radius: 1px;
	}
	.navbar-toggle .icon-bar + .icon-bar {
	  margin-top: 4px;
	}
	@media (min-width: 541px) {
	  .navbar-toggle {
	    display: none;
	  }
	}
	.navbar-nav {
	  margin: 3px 0px;
	}
	.navbar-nav > li > a {
	  padding-top: 10px;
	  padding-bottom: 10px;
	  line-height: 18px;
	}
	@media (max-width: 540px) {
	  .navbar-nav .open .dropdown-menu {
	    position: static;
	    float: none;
	    width: auto;
	    margin-top: 0;
	    background-color: transparent;
	    border: 0;
	    box-shadow: none;
	  }
	  .navbar-nav .open .dropdown-menu > li > a,
	  .navbar-nav .open .dropdown-menu .dropdown-header {
	    padding: 5px 15px 5px 25px;
	  }
	  .navbar-nav .open .dropdown-menu > li > a {
	    line-height: 18px;
	  }
	  .navbar-nav .open .dropdown-menu > li > a:hover,
	  .navbar-nav .open .dropdown-menu > li > a:focus {
	    background-image: none;
	  }
	}
	@media (min-width: 541px) {
	  .navbar-nav {
	    float: left;
	    margin: 0;
	  }
	  .navbar-nav > li {
	    float: left;
	  }
	  .navbar-nav > li > a {
	    padding-top: 6px;
	    padding-bottom: 6px;
	  }
	}
	.navbar-form {
	  margin-left: 0px;
	  margin-right: 0px;
	  padding: 10px 0px;
	  border-top: 1px solid transparent;
	  border-bottom: 1px solid transparent;
	  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
	  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(255, 255, 255, 0.1);
	  margin-top: -1px;
	  margin-bottom: -1px;
	}
	@media (min-width: 768px) {
	  .navbar-form .form-group {
	    display: inline-block;
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .navbar-form .form-control {
	    display: inline-block;
	    width: auto;
	    vertical-align: middle;
	  }
	  .navbar-form .form-control-static {
	    display: inline-block;
	  }
	  .navbar-form .input-group {
	    display: inline-table;
	    vertical-align: middle;
	  }
	  .navbar-form .input-group .input-group-addon,
	  .navbar-form .input-group .input-group-btn,
	  .navbar-form .input-group .form-control {
	    width: auto;
	  }
	  .navbar-form .input-group > .form-control {
	    width: 100%;
	  }
	  .navbar-form .control-label {
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .navbar-form .radio,
	  .navbar-form .checkbox {
	    display: inline-block;
	    margin-top: 0;
	    margin-bottom: 0;
	    vertical-align: middle;
	  }
	  .navbar-form .radio label,
	  .navbar-form .checkbox label {
	    padding-left: 0;
	  }
	  .navbar-form .radio input[type="radio"],
	  .navbar-form .checkbox input[type="checkbox"] {
	    position: relative;
	    margin-left: 0;
	  }
	  .navbar-form .has-feedback .form-control-feedback {
	    top: 0;
	  }
	}
	@media (max-width: 540px) {
	  .navbar-form .form-group {
	    margin-bottom: 5px;
	  }
	  .navbar-form .form-group:last-child {
	    margin-bottom: 0;
	  }
	}
	@media (min-width: 541px) {
	  .navbar-form {
	    width: auto;
	    border: 0;
	    margin-left: 0;
	    margin-right: 0;
	    padding-top: 0;
	    padding-bottom: 0;
	    -webkit-box-shadow: none;
	    box-shadow: none;
	  }
	}
	.navbar-nav > li > .dropdown-menu {
	  margin-top: 0;
	  border-top-right-radius: 0;
	  border-top-left-radius: 0;
	}
	.navbar-fixed-bottom .navbar-nav > li > .dropdown-menu {
	  margin-bottom: 0;
	  border-top-right-radius: 2px;
	  border-top-left-radius: 2px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.navbar-btn {
	  margin-top: -1px;
	  margin-bottom: -1px;
	}
	.navbar-btn.btn-sm {
	  margin-top: 0px;
	  margin-bottom: 0px;
	}
	.navbar-btn.btn-xs {
	  margin-top: 4px;
	  margin-bottom: 4px;
	}
	.navbar-text {
	  margin-top: 6px;
	  margin-bottom: 6px;
	}
	@media (min-width: 541px) {
	  .navbar-text {
	    float: left;
	    margin-left: 0px;
	    margin-right: 0px;
	  }
	}
	@media (min-width: 541px) {
	  .navbar-left {
	    float: left !important;
	    float: left;
	  }
	  .navbar-right {
	    float: right !important;
	    float: right;
	    margin-right: 0px;
	  }
	  .navbar-right ~ .navbar-right {
	    margin-right: 0;
	  }
	}
	.navbar-default {
	  background-color: #f8f8f8;
	  border-color: #e7e7e7;
	}
	.navbar-default .navbar-brand {
	  color: #777;
	}
	.navbar-default .navbar-brand:hover,
	.navbar-default .navbar-brand:focus {
	  color: #5e5e5e;
	  background-color: transparent;
	}
	.navbar-default .navbar-text {
	  color: #777;
	}
	.navbar-default .navbar-nav > li > a {
	  color: #777;
	}
	.navbar-default .navbar-nav > li > a:hover,
	.navbar-default .navbar-nav > li > a:focus {
	  color: #333;
	  background-color: transparent;
	}
	.navbar-default .navbar-nav > .active > a,
	.navbar-default .navbar-nav > .active > a:hover,
	.navbar-default .navbar-nav > .active > a:focus {
	  color: #555;
	  background-color: #e7e7e7;
	}
	.navbar-default .navbar-nav > .disabled > a,
	.navbar-default .navbar-nav > .disabled > a:hover,
	.navbar-default .navbar-nav > .disabled > a:focus {
	  color: #ccc;
	  background-color: transparent;
	}
	.navbar-default .navbar-toggle {
	  border-color: #ddd;
	}
	.navbar-default .navbar-toggle:hover,
	.navbar-default .navbar-toggle:focus {
	  background-color: #ddd;
	}
	.navbar-default .navbar-toggle .icon-bar {
	  background-color: #888;
	}
	.navbar-default .navbar-collapse,
	.navbar-default .navbar-form {
	  border-color: #e7e7e7;
	}
	.navbar-default .navbar-nav > .open > a,
	.navbar-default .navbar-nav > .open > a:hover,
	.navbar-default .navbar-nav > .open > a:focus {
	  background-color: #e7e7e7;
	  color: #555;
	}
	@media (max-width: 540px) {
	  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
	    color: #777;
	  }
	  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
	  .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
	    color: #333;
	    background-color: transparent;
	  }
	  .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
	  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
	  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
	    color: #555;
	    background-color: #e7e7e7;
	  }
	  .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a,
	  .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:hover,
	  .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:focus {
	    color: #ccc;
	    background-color: transparent;
	  }
	}
	.navbar-default .navbar-link {
	  color: #777;
	}
	.navbar-default .navbar-link:hover {
	  color: #333;
	}
	.navbar-default .btn-link {
	  color: #777;
	}
	.navbar-default .btn-link:hover,
	.navbar-default .btn-link:focus {
	  color: #333;
	}
	.navbar-default .btn-link[disabled]:hover,
	fieldset[disabled] .navbar-default .btn-link:hover,
	.navbar-default .btn-link[disabled]:focus,
	fieldset[disabled] .navbar-default .btn-link:focus {
	  color: #ccc;
	}
	.navbar-inverse {
	  background-color: #222;
	  border-color: #080808;
	}
	.navbar-inverse .navbar-brand {
	  color: #9d9d9d;
	}
	.navbar-inverse .navbar-brand:hover,
	.navbar-inverse .navbar-brand:focus {
	  color: #fff;
	  background-color: transparent;
	}
	.navbar-inverse .navbar-text {
	  color: #9d9d9d;
	}
	.navbar-inverse .navbar-nav > li > a {
	  color: #9d9d9d;
	}
	.navbar-inverse .navbar-nav > li > a:hover,
	.navbar-inverse .navbar-nav > li > a:focus {
	  color: #fff;
	  background-color: transparent;
	}
	.navbar-inverse .navbar-nav > .active > a,
	.navbar-inverse .navbar-nav > .active > a:hover,
	.navbar-inverse .navbar-nav > .active > a:focus {
	  color: #fff;
	  background-color: #080808;
	}
	.navbar-inverse .navbar-nav > .disabled > a,
	.navbar-inverse .navbar-nav > .disabled > a:hover,
	.navbar-inverse .navbar-nav > .disabled > a:focus {
	  color: #444;
	  background-color: transparent;
	}
	.navbar-inverse .navbar-toggle {
	  border-color: #333;
	}
	.navbar-inverse .navbar-toggle:hover,
	.navbar-inverse .navbar-toggle:focus {
	  background-color: #333;
	}
	.navbar-inverse .navbar-toggle .icon-bar {
	  background-color: #fff;
	}
	.navbar-inverse .navbar-collapse,
	.navbar-inverse .navbar-form {
	  border-color: #101010;
	}
	.navbar-inverse .navbar-nav > .open > a,
	.navbar-inverse .navbar-nav > .open > a:hover,
	.navbar-inverse .navbar-nav > .open > a:focus {
	  background-color: #080808;
	  color: #fff;
	}
	@media (max-width: 540px) {
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .dropdown-header {
	    border-color: #080808;
	  }
	  .navbar-inverse .navbar-nav .open .dropdown-menu .divider {
	    background-color: #080808;
	  }
	  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a {
	    color: #9d9d9d;
	  }
	  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover,
	  .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:focus {
	    color: #fff;
	    background-color: transparent;
	  }
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a,
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:hover,
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:focus {
	    color: #fff;
	    background-color: #080808;
	  }
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a,
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:hover,
	  .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:focus {
	    color: #444;
	    background-color: transparent;
	  }
	}
	.navbar-inverse .navbar-link {
	  color: #9d9d9d;
	}
	.navbar-inverse .navbar-link:hover {
	  color: #fff;
	}
	.navbar-inverse .btn-link {
	  color: #9d9d9d;
	}
	.navbar-inverse .btn-link:hover,
	.navbar-inverse .btn-link:focus {
	  color: #fff;
	}
	.navbar-inverse .btn-link[disabled]:hover,
	fieldset[disabled] .navbar-inverse .btn-link:hover,
	.navbar-inverse .btn-link[disabled]:focus,
	fieldset[disabled] .navbar-inverse .btn-link:focus {
	  color: #444;
	}
	.breadcrumb {
	  padding: 8px 15px;
	  margin-bottom: 18px;
	  list-style: none;
	  background-color: #f5f5f5;
	  border-radius: 2px;
	}
	.breadcrumb > li {
	  display: inline-block;
	}
	.breadcrumb > li + li:before {
	  content: "/\00a0";
	  padding: 0 5px;
	  color: #5e5e5e;
	}
	.breadcrumb > .active {
	  color: #777777;
	}
	.pagination {
	  display: inline-block;
	  padding-left: 0;
	  margin: 18px 0;
	  border-radius: 2px;
	}
	.pagination > li {
	  display: inline;
	}
	.pagination > li > a,
	.pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  line-height: 1.42857143;
	  text-decoration: none;
	  color: #337ab7;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  margin-left: -1px;
	}
	.pagination > li:first-child > a,
	.pagination > li:first-child > span {
	  margin-left: 0;
	  border-bottom-left-radius: 2px;
	  border-top-left-radius: 2px;
	}
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
	  border-bottom-right-radius: 2px;
	  border-top-right-radius: 2px;
	}
	.pagination > li > a:hover,
	.pagination > li > span:hover,
	.pagination > li > a:focus,
	.pagination > li > span:focus {
	  z-index: 2;
	  color: #23527c;
	  background-color: #eeeeee;
	  border-color: #ddd;
	}
	.pagination > .active > a,
	.pagination > .active > span,
	.pagination > .active > a:hover,
	.pagination > .active > span:hover,
	.pagination > .active > a:focus,
	.pagination > .active > span:focus {
	  z-index: 3;
	  color: #fff;
	  background-color: #337ab7;
	  border-color: #337ab7;
	  cursor: default;
	}
	.pagination > .disabled > span,
	.pagination > .disabled > span:hover,
	.pagination > .disabled > span:focus,
	.pagination > .disabled > a,
	.pagination > .disabled > a:hover,
	.pagination > .disabled > a:focus {
	  color: #777777;
	  background-color: #fff;
	  border-color: #ddd;
	  cursor: not-allowed;
	}
	.pagination-lg > li > a,
	.pagination-lg > li > span {
	  padding: 10px 16px;
	  font-size: 17px;
	  line-height: 1.3333333;
	}
	.pagination-lg > li:first-child > a,
	.pagination-lg > li:first-child > span {
	  border-bottom-left-radius: 3px;
	  border-top-left-radius: 3px;
	}
	.pagination-lg > li:last-child > a,
	.pagination-lg > li:last-child > span {
	  border-bottom-right-radius: 3px;
	  border-top-right-radius: 3px;
	}
	.pagination-sm > li > a,
	.pagination-sm > li > span {
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	}
	.pagination-sm > li:first-child > a,
	.pagination-sm > li:first-child > span {
	  border-bottom-left-radius: 1px;
	  border-top-left-radius: 1px;
	}
	.pagination-sm > li:last-child > a,
	.pagination-sm > li:last-child > span {
	  border-bottom-right-radius: 1px;
	  border-top-right-radius: 1px;
	}
	.pager {
	  padding-left: 0;
	  margin: 18px 0;
	  list-style: none;
	  text-align: center;
	}
	.pager li {
	  display: inline;
	}
	.pager li > a,
	.pager li > span {
	  display: inline-block;
	  padding: 5px 14px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  border-radius: 15px;
	}
	.pager li > a:hover,
	.pager li > a:focus {
	  text-decoration: none;
	  background-color: #eeeeee;
	}
	.pager .next > a,
	.pager .next > span {
	  float: right;
	}
	.pager .previous > a,
	.pager .previous > span {
	  float: left;
	}
	.pager .disabled > a,
	.pager .disabled > a:hover,
	.pager .disabled > a:focus,
	.pager .disabled > span {
	  color: #777777;
	  background-color: #fff;
	  cursor: not-allowed;
	}
	.label {
	  display: inline;
	  padding: .2em .6em .3em;
	  font-size: 75%;
	  font-weight: bold;
	  line-height: 1;
	  color: #fff;
	  text-align: center;
	  white-space: nowrap;
	  vertical-align: baseline;
	  border-radius: .25em;
	}
	a.label:hover,
	a.label:focus {
	  color: #fff;
	  text-decoration: none;
	  cursor: pointer;
	}
	.label:empty {
	  display: none;
	}
	.btn .label {
	  position: relative;
	  top: -1px;
	}
	.label-default {
	  background-color: #777777;
	}
	.label-default[href]:hover,
	.label-default[href]:focus {
	  background-color: #5e5e5e;
	}
	.label-primary {
	  background-color: #337ab7;
	}
	.label-primary[href]:hover,
	.label-primary[href]:focus {
	  background-color: #286090;
	}
	.label-success {
	  background-color: #5cb85c;
	}
	.label-success[href]:hover,
	.label-success[href]:focus {
	  background-color: #449d44;
	}
	.label-info {
	  background-color: #5bc0de;
	}
	.label-info[href]:hover,
	.label-info[href]:focus {
	  background-color: #31b0d5;
	}
	.label-warning {
	  background-color: #f0ad4e;
	}
	.label-warning[href]:hover,
	.label-warning[href]:focus {
	  background-color: #ec971f;
	}
	.label-danger {
	  background-color: #d9534f;
	}
	.label-danger[href]:hover,
	.label-danger[href]:focus {
	  background-color: #c9302c;
	}
	.badge {
	  display: inline-block;
	  min-width: 10px;
	  padding: 3px 7px;
	  font-size: 12px;
	  font-weight: bold;
	  color: #fff;
	  line-height: 1;
	  vertical-align: middle;
	  white-space: nowrap;
	  text-align: center;
	  background-color: #777777;
	  border-radius: 10px;
	}
	.badge:empty {
	  display: none;
	}
	.btn .badge {
	  position: relative;
	  top: -1px;
	}
	.btn-xs .badge,
	.btn-group-xs > .btn .badge {
	  top: 0;
	  padding: 1px 5px;
	}
	a.badge:hover,
	a.badge:focus {
	  color: #fff;
	  text-decoration: none;
	  cursor: pointer;
	}
	.list-group-item.active > .badge,
	.nav-pills > .active > a > .badge {
	  color: #337ab7;
	  background-color: #fff;
	}
	.list-group-item > .badge {
	  float: right;
	}
	.list-group-item > .badge + .badge {
	  margin-right: 5px;
	}
	.nav-pills > li > a > .badge {
	  margin-left: 3px;
	}
	.jumbotron {
	  padding-top: 30px;
	  padding-bottom: 30px;
	  margin-bottom: 30px;
	  color: inherit;
	  background-color: #eeeeee;
	}
	.jumbotron h1,
	.jumbotron .h1 {
	  color: inherit;
	}
	.jumbotron p {
	  margin-bottom: 15px;
	  font-size: 20px;
	  font-weight: 200;
	}
	.jumbotron > hr {
	  border-top-color: #d5d5d5;
	}
	.container .jumbotron,
	.container-fluid .jumbotron {
	  border-radius: 3px;
	  padding-left: 0px;
	  padding-right: 0px;
	}
	.jumbotron .container {
	  max-width: 100%;
	}
	@media screen and (min-width: 768px) {
	  .jumbotron {
	    padding-top: 48px;
	    padding-bottom: 48px;
	  }
	  .container .jumbotron,
	  .container-fluid .jumbotron {
	    padding-left: 60px;
	    padding-right: 60px;
	  }
	  .jumbotron h1,
	  .jumbotron .h1 {
	    font-size: 59px;
	  }
	}
	.thumbnail {
	  display: block;
	  padding: 4px;
	  margin-bottom: 18px;
	  line-height: 1.42857143;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  border-radius: 2px;
	  -webkit-transition: border 0.2s ease-in-out;
	  -o-transition: border 0.2s ease-in-out;
	  transition: border 0.2s ease-in-out;
	}
	.thumbnail > img,
	.thumbnail a > img {
	  margin-left: auto;
	  margin-right: auto;
	}
	a.thumbnail:hover,
	a.thumbnail:focus,
	a.thumbnail.active {
	  border-color: #337ab7;
	}
	.thumbnail .caption {
	  padding: 9px;
	  color: #000;
	}
	.alert {
	  padding: 15px;
	  margin-bottom: 18px;
	  border: 1px solid transparent;
	  border-radius: 2px;
	}
	.alert h4 {
	  margin-top: 0;
	  color: inherit;
	}
	.alert .alert-link {
	  font-weight: bold;
	}
	.alert > p,
	.alert > ul {
	  margin-bottom: 0;
	}
	.alert > p + p {
	  margin-top: 5px;
	}
	.alert-dismissable,
	.alert-dismissible {
	  padding-right: 35px;
	}
	.alert-dismissable .close,
	.alert-dismissible .close {
	  position: relative;
	  top: -2px;
	  right: -21px;
	  color: inherit;
	}
	.alert-success {
	  background-color: #dff0d8;
	  border-color: #d6e9c6;
	  color: #3c763d;
	}
	.alert-success hr {
	  border-top-color: #c9e2b3;
	}
	.alert-success .alert-link {
	  color: #2b542c;
	}
	.alert-info {
	  background-color: #d9edf7;
	  border-color: #bce8f1;
	  color: #31708f;
	}
	.alert-info hr {
	  border-top-color: #a6e1ec;
	}
	.alert-info .alert-link {
	  color: #245269;
	}
	.alert-warning {
	  background-color: #fcf8e3;
	  border-color: #faebcc;
	  color: #8a6d3b;
	}
	.alert-warning hr {
	  border-top-color: #f7e1b5;
	}
	.alert-warning .alert-link {
	  color: #66512c;
	}
	.alert-danger {
	  background-color: #f2dede;
	  border-color: #ebccd1;
	  color: #a94442;
	}
	.alert-danger hr {
	  border-top-color: #e4b9c0;
	}
	.alert-danger .alert-link {
	  color: #843534;
	}
	@-webkit-keyframes progress-bar-stripes {
	  from {
	    background-position: 40px 0;
	  }
	  to {
	    background-position: 0 0;
	  }
	}
	@keyframes progress-bar-stripes {
	  from {
	    background-position: 40px 0;
	  }
	  to {
	    background-position: 0 0;
	  }
	}
	.progress {
	  overflow: hidden;
	  height: 18px;
	  margin-bottom: 18px;
	  background-color: #f5f5f5;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	}
	.progress-bar {
	  float: left;
	  width: 0%;
	  height: 100%;
	  font-size: 12px;
	  line-height: 18px;
	  color: #fff;
	  text-align: center;
	  background-color: #337ab7;
	  -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
	  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
	  -webkit-transition: width 0.6s ease;
	  -o-transition: width 0.6s ease;
	  transition: width 0.6s ease;
	}
	.progress-striped .progress-bar,
	.progress-bar-striped {
	  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-size: 40px 40px;
	}
	.progress.active .progress-bar,
	.progress-bar.active {
	  -webkit-animation: progress-bar-stripes 2s linear infinite;
	  -o-animation: progress-bar-stripes 2s linear infinite;
	  animation: progress-bar-stripes 2s linear infinite;
	}
	.progress-bar-success {
	  background-color: #5cb85c;
	}
	.progress-striped .progress-bar-success {
	  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	}
	.progress-bar-info {
	  background-color: #5bc0de;
	}
	.progress-striped .progress-bar-info {
	  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	}
	.progress-bar-warning {
	  background-color: #f0ad4e;
	}
	.progress-striped .progress-bar-warning {
	  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	}
	.progress-bar-danger {
	  background-color: #d9534f;
	}
	.progress-striped .progress-bar-danger {
	  background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	}
	.media {
	  margin-top: 15px;
	}
	.media:first-child {
	  margin-top: 0;
	}
	.media,
	.media-body {
	  zoom: 1;
	  overflow: hidden;
	}
	.media-body {
	  width: 10000px;
	}
	.media-object {
	  display: block;
	}
	.media-object.img-thumbnail {
	  max-width: none;
	}
	.media-right,
	.media > .pull-right {
	  padding-left: 10px;
	}
	.media-left,
	.media > .pull-left {
	  padding-right: 10px;
	}
	.media-left,
	.media-right,
	.media-body {
	  display: table-cell;
	  vertical-align: top;
	}
	.media-middle {
	  vertical-align: middle;
	}
	.media-bottom {
	  vertical-align: bottom;
	}
	.media-heading {
	  margin-top: 0;
	  margin-bottom: 5px;
	}
	.media-list {
	  padding-left: 0;
	  list-style: none;
	}
	.list-group {
	  margin-bottom: 20px;
	  padding-left: 0;
	}
	.list-group-item {
	  position: relative;
	  display: block;
	  padding: 10px 15px;
	  margin-bottom: -1px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	}
	.list-group-item:first-child {
	  border-top-right-radius: 2px;
	  border-top-left-radius: 2px;
	}
	.list-group-item:last-child {
	  margin-bottom: 0;
	  border-bottom-right-radius: 2px;
	  border-bottom-left-radius: 2px;
	}
	a.list-group-item,
	button.list-group-item {
	  color: #555;
	}
	a.list-group-item .list-group-item-heading,
	button.list-group-item .list-group-item-heading {
	  color: #333;
	}
	a.list-group-item:hover,
	button.list-group-item:hover,
	a.list-group-item:focus,
	button.list-group-item:focus {
	  text-decoration: none;
	  color: #555;
	  background-color: #f5f5f5;
	}
	button.list-group-item {
	  width: 100%;
	  text-align: left;
	}
	.list-group-item.disabled,
	.list-group-item.disabled:hover,
	.list-group-item.disabled:focus {
	  background-color: #eeeeee;
	  color: #777777;
	  cursor: not-allowed;
	}
	.list-group-item.disabled .list-group-item-heading,
	.list-group-item.disabled:hover .list-group-item-heading,
	.list-group-item.disabled:focus .list-group-item-heading {
	  color: inherit;
	}
	.list-group-item.disabled .list-group-item-text,
	.list-group-item.disabled:hover .list-group-item-text,
	.list-group-item.disabled:focus .list-group-item-text {
	  color: #777777;
	}
	.list-group-item.active,
	.list-group-item.active:hover,
	.list-group-item.active:focus {
	  z-index: 2;
	  color: #fff;
	  background-color: #337ab7;
	  border-color: #337ab7;
	}
	.list-group-item.active .list-group-item-heading,
	.list-group-item.active:hover .list-group-item-heading,
	.list-group-item.active:focus .list-group-item-heading,
	.list-group-item.active .list-group-item-heading > small,
	.list-group-item.active:hover .list-group-item-heading > small,
	.list-group-item.active:focus .list-group-item-heading > small,
	.list-group-item.active .list-group-item-heading > .small,
	.list-group-item.active:hover .list-group-item-heading > .small,
	.list-group-item.active:focus .list-group-item-heading > .small {
	  color: inherit;
	}
	.list-group-item.active .list-group-item-text,
	.list-group-item.active:hover .list-group-item-text,
	.list-group-item.active:focus .list-group-item-text {
	  color: #c7ddef;
	}
	.list-group-item-success {
	  color: #3c763d;
	  background-color: #dff0d8;
	}
	a.list-group-item-success,
	button.list-group-item-success {
	  color: #3c763d;
	}
	a.list-group-item-success .list-group-item-heading,
	button.list-group-item-success .list-group-item-heading {
	  color: inherit;
	}
	a.list-group-item-success:hover,
	button.list-group-item-success:hover,
	a.list-group-item-success:focus,
	button.list-group-item-success:focus {
	  color: #3c763d;
	  background-color: #d0e9c6;
	}
	a.list-group-item-success.active,
	button.list-group-item-success.active,
	a.list-group-item-success.active:hover,
	button.list-group-item-success.active:hover,
	a.list-group-item-success.active:focus,
	button.list-group-item-success.active:focus {
	  color: #fff;
	  background-color: #3c763d;
	  border-color: #3c763d;
	}
	.list-group-item-info {
	  color: #31708f;
	  background-color: #d9edf7;
	}
	a.list-group-item-info,
	button.list-group-item-info {
	  color: #31708f;
	}
	a.list-group-item-info .list-group-item-heading,
	button.list-group-item-info .list-group-item-heading {
	  color: inherit;
	}
	a.list-group-item-info:hover,
	button.list-group-item-info:hover,
	a.list-group-item-info:focus,
	button.list-group-item-info:focus {
	  color: #31708f;
	  background-color: #c4e3f3;
	}
	a.list-group-item-info.active,
	button.list-group-item-info.active,
	a.list-group-item-info.active:hover,
	button.list-group-item-info.active:hover,
	a.list-group-item-info.active:focus,
	button.list-group-item-info.active:focus {
	  color: #fff;
	  background-color: #31708f;
	  border-color: #31708f;
	}
	.list-group-item-warning {
	  color: #8a6d3b;
	  background-color: #fcf8e3;
	}
	a.list-group-item-warning,
	button.list-group-item-warning {
	  color: #8a6d3b;
	}
	a.list-group-item-warning .list-group-item-heading,
	button.list-group-item-warning .list-group-item-heading {
	  color: inherit;
	}
	a.list-group-item-warning:hover,
	button.list-group-item-warning:hover,
	a.list-group-item-warning:focus,
	button.list-group-item-warning:focus {
	  color: #8a6d3b;
	  background-color: #faf2cc;
	}
	a.list-group-item-warning.active,
	button.list-group-item-warning.active,
	a.list-group-item-warning.active:hover,
	button.list-group-item-warning.active:hover,
	a.list-group-item-warning.active:focus,
	button.list-group-item-warning.active:focus {
	  color: #fff;
	  background-color: #8a6d3b;
	  border-color: #8a6d3b;
	}
	.list-group-item-danger {
	  color: #a94442;
	  background-color: #f2dede;
	}
	a.list-group-item-danger,
	button.list-group-item-danger {
	  color: #a94442;
	}
	a.list-group-item-danger .list-group-item-heading,
	button.list-group-item-danger .list-group-item-heading {
	  color: inherit;
	}
	a.list-group-item-danger:hover,
	button.list-group-item-danger:hover,
	a.list-group-item-danger:focus,
	button.list-group-item-danger:focus {
	  color: #a94442;
	  background-color: #ebcccc;
	}
	a.list-group-item-danger.active,
	button.list-group-item-danger.active,
	a.list-group-item-danger.active:hover,
	button.list-group-item-danger.active:hover,
	a.list-group-item-danger.active:focus,
	button.list-group-item-danger.active:focus {
	  color: #fff;
	  background-color: #a94442;
	  border-color: #a94442;
	}
	.list-group-item-heading {
	  margin-top: 0;
	  margin-bottom: 5px;
	}
	.list-group-item-text {
	  margin-bottom: 0;
	  line-height: 1.3;
	}
	.panel {
	  margin-bottom: 18px;
	  background-color: #fff;
	  border: 1px solid transparent;
	  border-radius: 2px;
	  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	}
	.panel-body {
	  padding: 15px;
	}
	.panel-heading {
	  padding: 10px 15px;
	  border-bottom: 1px solid transparent;
	  border-top-right-radius: 1px;
	  border-top-left-radius: 1px;
	}
	.panel-heading > .dropdown .dropdown-toggle {
	  color: inherit;
	}
	.panel-title {
	  margin-top: 0;
	  margin-bottom: 0;
	  font-size: 15px;
	  color: inherit;
	}
	.panel-title > a,
	.panel-title > small,
	.panel-title > .small,
	.panel-title > small > a,
	.panel-title > .small > a {
	  color: inherit;
	}
	.panel-footer {
	  padding: 10px 15px;
	  background-color: #f5f5f5;
	  border-top: 1px solid #ddd;
	  border-bottom-right-radius: 1px;
	  border-bottom-left-radius: 1px;
	}
	.panel > .list-group,
	.panel > .panel-collapse > .list-group {
	  margin-bottom: 0;
	}
	.panel > .list-group .list-group-item,
	.panel > .panel-collapse > .list-group .list-group-item {
	  border-width: 1px 0;
	  border-radius: 0;
	}
	.panel > .list-group:first-child .list-group-item:first-child,
	.panel > .panel-collapse > .list-group:first-child .list-group-item:first-child {
	  border-top: 0;
	  border-top-right-radius: 1px;
	  border-top-left-radius: 1px;
	}
	.panel > .list-group:last-child .list-group-item:last-child,
	.panel > .panel-collapse > .list-group:last-child .list-group-item:last-child {
	  border-bottom: 0;
	  border-bottom-right-radius: 1px;
	  border-bottom-left-radius: 1px;
	}
	.panel > .panel-heading + .panel-collapse > .list-group .list-group-item:first-child {
	  border-top-right-radius: 0;
	  border-top-left-radius: 0;
	}
	.panel-heading + .list-group .list-group-item:first-child {
	  border-top-width: 0;
	}
	.list-group + .panel-footer {
	  border-top-width: 0;
	}
	.panel > .table,
	.panel > .table-responsive > .table,
	.panel > .panel-collapse > .table {
	  margin-bottom: 0;
	}
	.panel > .table caption,
	.panel > .table-responsive > .table caption,
	.panel > .panel-collapse > .table caption {
	  padding-left: 15px;
	  padding-right: 15px;
	}
	.panel > .table:first-child,
	.panel > .table-responsive:first-child > .table:first-child {
	  border-top-right-radius: 1px;
	  border-top-left-radius: 1px;
	}
	.panel > .table:first-child > thead:first-child > tr:first-child,
	.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child,
	.panel > .table:first-child > tbody:first-child > tr:first-child,
	.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child {
	  border-top-left-radius: 1px;
	  border-top-right-radius: 1px;
	}
	.panel > .table:first-child > thead:first-child > tr:first-child td:first-child,
	.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:first-child,
	.panel > .table:first-child > tbody:first-child > tr:first-child td:first-child,
	.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:first-child,
	.panel > .table:first-child > thead:first-child > tr:first-child th:first-child,
	.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:first-child,
	.panel > .table:first-child > tbody:first-child > tr:first-child th:first-child,
	.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:first-child {
	  border-top-left-radius: 1px;
	}
	.panel > .table:first-child > thead:first-child > tr:first-child td:last-child,
	.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:last-child,
	.panel > .table:first-child > tbody:first-child > tr:first-child td:last-child,
	.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:last-child,
	.panel > .table:first-child > thead:first-child > tr:first-child th:last-child,
	.panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:last-child,
	.panel > .table:first-child > tbody:first-child > tr:first-child th:last-child,
	.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:last-child {
	  border-top-right-radius: 1px;
	}
	.panel > .table:last-child,
	.panel > .table-responsive:last-child > .table:last-child {
	  border-bottom-right-radius: 1px;
	  border-bottom-left-radius: 1px;
	}
	.panel > .table:last-child > tbody:last-child > tr:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child,
	.panel > .table:last-child > tfoot:last-child > tr:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child {
	  border-bottom-left-radius: 1px;
	  border-bottom-right-radius: 1px;
	}
	.panel > .table:last-child > tbody:last-child > tr:last-child td:first-child,
	.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:first-child,
	.panel > .table:last-child > tfoot:last-child > tr:last-child td:first-child,
	.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:first-child,
	.panel > .table:last-child > tbody:last-child > tr:last-child th:first-child,
	.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:first-child,
	.panel > .table:last-child > tfoot:last-child > tr:last-child th:first-child,
	.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:first-child {
	  border-bottom-left-radius: 1px;
	}
	.panel > .table:last-child > tbody:last-child > tr:last-child td:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:last-child,
	.panel > .table:last-child > tfoot:last-child > tr:last-child td:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:last-child,
	.panel > .table:last-child > tbody:last-child > tr:last-child th:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:last-child,
	.panel > .table:last-child > tfoot:last-child > tr:last-child th:last-child,
	.panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:last-child {
	  border-bottom-right-radius: 1px;
	}
	.panel > .panel-body + .table,
	.panel > .panel-body + .table-responsive,
	.panel > .table + .panel-body,
	.panel > .table-responsive + .panel-body {
	  border-top: 1px solid #ddd;
	}
	.panel > .table > tbody:first-child > tr:first-child th,
	.panel > .table > tbody:first-child > tr:first-child td {
	  border-top: 0;
	}
	.panel > .table-bordered,
	.panel > .table-responsive > .table-bordered {
	  border: 0;
	}
	.panel > .table-bordered > thead > tr > th:first-child,
	.panel > .table-responsive > .table-bordered > thead > tr > th:first-child,
	.panel > .table-bordered > tbody > tr > th:first-child,
	.panel > .table-responsive > .table-bordered > tbody > tr > th:first-child,
	.panel > .table-bordered > tfoot > tr > th:first-child,
	.panel > .table-responsive > .table-bordered > tfoot > tr > th:first-child,
	.panel > .table-bordered > thead > tr > td:first-child,
	.panel > .table-responsive > .table-bordered > thead > tr > td:first-child,
	.panel > .table-bordered > tbody > tr > td:first-child,
	.panel > .table-responsive > .table-bordered > tbody > tr > td:first-child,
	.panel > .table-bordered > tfoot > tr > td:first-child,
	.panel > .table-responsive > .table-bordered > tfoot > tr > td:first-child {
	  border-left: 0;
	}
	.panel > .table-bordered > thead > tr > th:last-child,
	.panel > .table-responsive > .table-bordered > thead > tr > th:last-child,
	.panel > .table-bordered > tbody > tr > th:last-child,
	.panel > .table-responsive > .table-bordered > tbody > tr > th:last-child,
	.panel > .table-bordered > tfoot > tr > th:last-child,
	.panel > .table-responsive > .table-bordered > tfoot > tr > th:last-child,
	.panel > .table-bordered > thead > tr > td:last-child,
	.panel > .table-responsive > .table-bordered > thead > tr > td:last-child,
	.panel > .table-bordered > tbody > tr > td:last-child,
	.panel > .table-responsive > .table-bordered > tbody > tr > td:last-child,
	.panel > .table-bordered > tfoot > tr > td:last-child,
	.panel > .table-responsive > .table-bordered > tfoot > tr > td:last-child {
	  border-right: 0;
	}
	.panel > .table-bordered > thead > tr:first-child > td,
	.panel > .table-responsive > .table-bordered > thead > tr:first-child > td,
	.panel > .table-bordered > tbody > tr:first-child > td,
	.panel > .table-responsive > .table-bordered > tbody > tr:first-child > td,
	.panel > .table-bordered > thead > tr:first-child > th,
	.panel > .table-responsive > .table-bordered > thead > tr:first-child > th,
	.panel > .table-bordered > tbody > tr:first-child > th,
	.panel > .table-responsive > .table-bordered > tbody > tr:first-child > th {
	  border-bottom: 0;
	}
	.panel > .table-bordered > tbody > tr:last-child > td,
	.panel > .table-responsive > .table-bordered > tbody > tr:last-child > td,
	.panel > .table-bordered > tfoot > tr:last-child > td,
	.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > td,
	.panel > .table-bordered > tbody > tr:last-child > th,
	.panel > .table-responsive > .table-bordered > tbody > tr:last-child > th,
	.panel > .table-bordered > tfoot > tr:last-child > th,
	.panel > .table-responsive > .table-bordered > tfoot > tr:last-child > th {
	  border-bottom: 0;
	}
	.panel > .table-responsive {
	  border: 0;
	  margin-bottom: 0;
	}
	.panel-group {
	  margin-bottom: 18px;
	}
	.panel-group .panel {
	  margin-bottom: 0;
	  border-radius: 2px;
	}
	.panel-group .panel + .panel {
	  margin-top: 5px;
	}
	.panel-group .panel-heading {
	  border-bottom: 0;
	}
	.panel-group .panel-heading + .panel-collapse > .panel-body,
	.panel-group .panel-heading + .panel-collapse > .list-group {
	  border-top: 1px solid #ddd;
	}
	.panel-group .panel-footer {
	  border-top: 0;
	}
	.panel-group .panel-footer + .panel-collapse .panel-body {
	  border-bottom: 1px solid #ddd;
	}
	.panel-default {
	  border-color: #ddd;
	}
	.panel-default > .panel-heading {
	  color: #333333;
	  background-color: #f5f5f5;
	  border-color: #ddd;
	}
	.panel-default > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #ddd;
	}
	.panel-default > .panel-heading .badge {
	  color: #f5f5f5;
	  background-color: #333333;
	}
	.panel-default > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #ddd;
	}
	.panel-primary {
	  border-color: #337ab7;
	}
	.panel-primary > .panel-heading {
	  color: #fff;
	  background-color: #337ab7;
	  border-color: #337ab7;
	}
	.panel-primary > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #337ab7;
	}
	.panel-primary > .panel-heading .badge {
	  color: #337ab7;
	  background-color: #fff;
	}
	.panel-primary > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #337ab7;
	}
	.panel-success {
	  border-color: #d6e9c6;
	}
	.panel-success > .panel-heading {
	  color: #3c763d;
	  background-color: #dff0d8;
	  border-color: #d6e9c6;
	}
	.panel-success > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #d6e9c6;
	}
	.panel-success > .panel-heading .badge {
	  color: #dff0d8;
	  background-color: #3c763d;
	}
	.panel-success > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #d6e9c6;
	}
	.panel-info {
	  border-color: #bce8f1;
	}
	.panel-info > .panel-heading {
	  color: #31708f;
	  background-color: #d9edf7;
	  border-color: #bce8f1;
	}
	.panel-info > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #bce8f1;
	}
	.panel-info > .panel-heading .badge {
	  color: #d9edf7;
	  background-color: #31708f;
	}
	.panel-info > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #bce8f1;
	}
	.panel-warning {
	  border-color: #faebcc;
	}
	.panel-warning > .panel-heading {
	  color: #8a6d3b;
	  background-color: #fcf8e3;
	  border-color: #faebcc;
	}
	.panel-warning > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #faebcc;
	}
	.panel-warning > .panel-heading .badge {
	  color: #fcf8e3;
	  background-color: #8a6d3b;
	}
	.panel-warning > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #faebcc;
	}
	.panel-danger {
	  border-color: #ebccd1;
	}
	.panel-danger > .panel-heading {
	  color: #a94442;
	  background-color: #f2dede;
	  border-color: #ebccd1;
	}
	.panel-danger > .panel-heading + .panel-collapse > .panel-body {
	  border-top-color: #ebccd1;
	}
	.panel-danger > .panel-heading .badge {
	  color: #f2dede;
	  background-color: #a94442;
	}
	.panel-danger > .panel-footer + .panel-collapse > .panel-body {
	  border-bottom-color: #ebccd1;
	}
	.embed-responsive {
	  position: relative;
	  display: block;
	  height: 0;
	  padding: 0;
	  overflow: hidden;
	}
	.embed-responsive .embed-responsive-item,
	.embed-responsive iframe,
	.embed-responsive embed,
	.embed-responsive object,
	.embed-responsive video {
	  position: absolute;
	  top: 0;
	  left: 0;
	  bottom: 0;
	  height: 100%;
	  width: 100%;
	  border: 0;
	}
	.embed-responsive-16by9 {
	  padding-bottom: 56.25%;
	}
	.embed-responsive-4by3 {
	  padding-bottom: 75%;
	}
	.well {
	  min-height: 20px;
	  padding: 19px;
	  margin-bottom: 20px;
	  background-color: #f5f5f5;
	  border: 1px solid #e3e3e3;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	}
	.well blockquote {
	  border-color: #ddd;
	  border-color: rgba(0, 0, 0, 0.15);
	}
	.well-lg {
	  padding: 24px;
	  border-radius: 3px;
	}
	.well-sm {
	  padding: 9px;
	  border-radius: 1px;
	}
	.close {
	  float: right;
	  font-size: 19.5px;
	  font-weight: bold;
	  line-height: 1;
	  color: #000;
	  text-shadow: 0 1px 0 #fff;
	  opacity: 0.2;
	  filter: alpha(opacity=20);
	}
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	  opacity: 0.5;
	  filter: alpha(opacity=50);
	}
	button.close {
	  padding: 0;
	  cursor: pointer;
	  background: transparent;
	  border: 0;
	  -webkit-appearance: none;
	}
	.modal-open {
	  overflow: hidden;
	}
	.modal {
	  display: none;
	  overflow: hidden;
	  position: fixed;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  z-index: 1050;
	  -webkit-overflow-scrolling: touch;
	  outline: 0;
	}
	.modal.fade .modal-dialog {
	  -webkit-transform: translate(0, -25%);
	  -ms-transform: translate(0, -25%);
	  -o-transform: translate(0, -25%);
	  transform: translate(0, -25%);
	  -webkit-transition: -webkit-transform 0.3s ease-out;
	  -moz-transition: -moz-transform 0.3s ease-out;
	  -o-transition: -o-transform 0.3s ease-out;
	  transition: transform 0.3s ease-out;
	}
	.modal.in .modal-dialog {
	  -webkit-transform: translate(0, 0);
	  -ms-transform: translate(0, 0);
	  -o-transform: translate(0, 0);
	  transform: translate(0, 0);
	}
	.modal-open .modal {
	  overflow-x: hidden;
	  overflow-y: auto;
	}
	.modal-dialog {
	  position: relative;
	  width: auto;
	  margin: 10px;
	}
	.modal-content {
	  position: relative;
	  background-color: #fff;
	  border: 1px solid #999;
	  border: 1px solid rgba(0, 0, 0, 0.2);
	  border-radius: 3px;
	  -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	  box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	  background-clip: padding-box;
	  outline: 0;
	}
	.modal-backdrop {
	  position: fixed;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  z-index: 1040;
	  background-color: #000;
	}
	.modal-backdrop.fade {
	  opacity: 0;
	  filter: alpha(opacity=0);
	}
	.modal-backdrop.in {
	  opacity: 0.5;
	  filter: alpha(opacity=50);
	}
	.modal-header {
	  padding: 15px;
	  border-bottom: 1px solid #e5e5e5;
	}
	.modal-header .close {
	  margin-top: -2px;
	}
	.modal-title {
	  margin: 0;
	  line-height: 1.42857143;
	}
	.modal-body {
	  position: relative;
	  padding: 15px;
	}
	.modal-footer {
	  padding: 15px;
	  text-align: right;
	  border-top: 1px solid #e5e5e5;
	}
	.modal-footer .btn + .btn {
	  margin-left: 5px;
	  margin-bottom: 0;
	}
	.modal-footer .btn-group .btn + .btn {
	  margin-left: -1px;
	}
	.modal-footer .btn-block + .btn-block {
	  margin-left: 0;
	}
	.modal-scrollbar-measure {
	  position: absolute;
	  top: -9999px;
	  width: 50px;
	  height: 50px;
	  overflow: scroll;
	}
	@media (min-width: 768px) {
	  .modal-dialog {
	    width: 600px;
	    margin: 30px auto;
	  }
	  .modal-content {
	    -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	  }
	  .modal-sm {
	    width: 300px;
	  }
	}
	@media (min-width: 992px) {
	  .modal-lg {
	    width: 900px;
	  }
	}
	.tooltip {
	  position: absolute;
	  z-index: 1070;
	  display: block;
	  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  font-style: normal;
	  font-weight: normal;
	  letter-spacing: normal;
	  line-break: auto;
	  line-height: 1.42857143;
	  text-align: left;
	  text-align: start;
	  text-decoration: none;
	  text-shadow: none;
	  text-transform: none;
	  white-space: normal;
	  word-break: normal;
	  word-spacing: normal;
	  word-wrap: normal;
	  font-size: 12px;
	  opacity: 0;
	  filter: alpha(opacity=0);
	}
	.tooltip.in {
	  opacity: 0.9;
	  filter: alpha(opacity=90);
	}
	.tooltip.top {
	  margin-top: -3px;
	  padding: 5px 0;
	}
	.tooltip.right {
	  margin-left: 3px;
	  padding: 0 5px;
	}
	.tooltip.bottom {
	  margin-top: 3px;
	  padding: 5px 0;
	}
	.tooltip.left {
	  margin-left: -3px;
	  padding: 0 5px;
	}
	.tooltip-inner {
	  max-width: 200px;
	  padding: 3px 8px;
	  color: #fff;
	  text-align: center;
	  background-color: #000;
	  border-radius: 2px;
	}
	.tooltip-arrow {
	  position: absolute;
	  width: 0;
	  height: 0;
	  border-color: transparent;
	  border-style: solid;
	}
	.tooltip.top .tooltip-arrow {
	  bottom: 0;
	  left: 50%;
	  margin-left: -5px;
	  border-width: 5px 5px 0;
	  border-top-color: #000;
	}
	.tooltip.top-left .tooltip-arrow {
	  bottom: 0;
	  right: 5px;
	  margin-bottom: -5px;
	  border-width: 5px 5px 0;
	  border-top-color: #000;
	}
	.tooltip.top-right .tooltip-arrow {
	  bottom: 0;
	  left: 5px;
	  margin-bottom: -5px;
	  border-width: 5px 5px 0;
	  border-top-color: #000;
	}
	.tooltip.right .tooltip-arrow {
	  top: 50%;
	  left: 0;
	  margin-top: -5px;
	  border-width: 5px 5px 5px 0;
	  border-right-color: #000;
	}
	.tooltip.left .tooltip-arrow {
	  top: 50%;
	  right: 0;
	  margin-top: -5px;
	  border-width: 5px 0 5px 5px;
	  border-left-color: #000;
	}
	.tooltip.bottom .tooltip-arrow {
	  top: 0;
	  left: 50%;
	  margin-left: -5px;
	  border-width: 0 5px 5px;
	  border-bottom-color: #000;
	}
	.tooltip.bottom-left .tooltip-arrow {
	  top: 0;
	  right: 5px;
	  margin-top: -5px;
	  border-width: 0 5px 5px;
	  border-bottom-color: #000;
	}
	.tooltip.bottom-right .tooltip-arrow {
	  top: 0;
	  left: 5px;
	  margin-top: -5px;
	  border-width: 0 5px 5px;
	  border-bottom-color: #000;
	}
	.popover {
	  position: absolute;
	  top: 0;
	  left: 0;
	  z-index: 1060;
	  display: none;
	  max-width: 276px;
	  padding: 1px;
	  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  font-style: normal;
	  font-weight: normal;
	  letter-spacing: normal;
	  line-break: auto;
	  line-height: 1.42857143;
	  text-align: left;
	  text-align: start;
	  text-decoration: none;
	  text-shadow: none;
	  text-transform: none;
	  white-space: normal;
	  word-break: normal;
	  word-spacing: normal;
	  word-wrap: normal;
	  font-size: 13px;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #ccc;
	  border: 1px solid rgba(0, 0, 0, 0.2);
	  border-radius: 3px;
	  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	}
	.popover.top {
	  margin-top: -10px;
	}
	.popover.right {
	  margin-left: 10px;
	}
	.popover.bottom {
	  margin-top: 10px;
	}
	.popover.left {
	  margin-left: -10px;
	}
	.popover-title {
	  margin: 0;
	  padding: 8px 14px;
	  font-size: 13px;
	  background-color: #f7f7f7;
	  border-bottom: 1px solid #ebebeb;
	  border-radius: 2px 2px 0 0;
	}
	.popover-content {
	  padding: 9px 14px;
	}
	.popover > .arrow,
	.popover > .arrow:after {
	  position: absolute;
	  display: block;
	  width: 0;
	  height: 0;
	  border-color: transparent;
	  border-style: solid;
	}
	.popover > .arrow {
	  border-width: 11px;
	}
	.popover > .arrow:after {
	  border-width: 10px;
	  content: "";
	}
	.popover.top > .arrow {
	  left: 50%;
	  margin-left: -11px;
	  border-bottom-width: 0;
	  border-top-color: #999999;
	  border-top-color: rgba(0, 0, 0, 0.25);
	  bottom: -11px;
	}
	.popover.top > .arrow:after {
	  content: " ";
	  bottom: 1px;
	  margin-left: -10px;
	  border-bottom-width: 0;
	  border-top-color: #fff;
	}
	.popover.right > .arrow {
	  top: 50%;
	  left: -11px;
	  margin-top: -11px;
	  border-left-width: 0;
	  border-right-color: #999999;
	  border-right-color: rgba(0, 0, 0, 0.25);
	}
	.popover.right > .arrow:after {
	  content: " ";
	  left: 1px;
	  bottom: -10px;
	  border-left-width: 0;
	  border-right-color: #fff;
	}
	.popover.bottom > .arrow {
	  left: 50%;
	  margin-left: -11px;
	  border-top-width: 0;
	  border-bottom-color: #999999;
	  border-bottom-color: rgba(0, 0, 0, 0.25);
	  top: -11px;
	}
	.popover.bottom > .arrow:after {
	  content: " ";
	  top: 1px;
	  margin-left: -10px;
	  border-top-width: 0;
	  border-bottom-color: #fff;
	}
	.popover.left > .arrow {
	  top: 50%;
	  right: -11px;
	  margin-top: -11px;
	  border-right-width: 0;
	  border-left-color: #999999;
	  border-left-color: rgba(0, 0, 0, 0.25);
	}
	.popover.left > .arrow:after {
	  content: " ";
	  right: 1px;
	  border-right-width: 0;
	  border-left-color: #fff;
	  bottom: -10px;
	}
	.carousel {
	  position: relative;
	}
	.carousel-inner {
	  position: relative;
	  overflow: hidden;
	  width: 100%;
	}
	.carousel-inner > .item {
	  display: none;
	  position: relative;
	  -webkit-transition: 0.6s ease-in-out left;
	  -o-transition: 0.6s ease-in-out left;
	  transition: 0.6s ease-in-out left;
	}
	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img {
	  line-height: 1;
	}
	@media all and (transform-3d), (-webkit-transform-3d) {
	  .carousel-inner > .item {
	    -webkit-transition: -webkit-transform 0.6s ease-in-out;
	    -moz-transition: -moz-transform 0.6s ease-in-out;
	    -o-transition: -o-transform 0.6s ease-in-out;
	    transition: transform 0.6s ease-in-out;
	    -webkit-backface-visibility: hidden;
	    -moz-backface-visibility: hidden;
	    backface-visibility: hidden;
	    -webkit-perspective: 1000px;
	    -moz-perspective: 1000px;
	    perspective: 1000px;
	  }
	  .carousel-inner > .item.next,
	  .carousel-inner > .item.active.right {
	    -webkit-transform: translate3d(100%, 0, 0);
	    transform: translate3d(100%, 0, 0);
	    left: 0;
	  }
	  .carousel-inner > .item.prev,
	  .carousel-inner > .item.active.left {
	    -webkit-transform: translate3d(-100%, 0, 0);
	    transform: translate3d(-100%, 0, 0);
	    left: 0;
	  }
	  .carousel-inner > .item.next.left,
	  .carousel-inner > .item.prev.right,
	  .carousel-inner > .item.active {
	    -webkit-transform: translate3d(0, 0, 0);
	    transform: translate3d(0, 0, 0);
	    left: 0;
	  }
	}
	.carousel-inner > .active,
	.carousel-inner > .next,
	.carousel-inner > .prev {
	  display: block;
	}
	.carousel-inner > .active {
	  left: 0;
	}
	.carousel-inner > .next,
	.carousel-inner > .prev {
	  position: absolute;
	  top: 0;
	  width: 100%;
	}
	.carousel-inner > .next {
	  left: 100%;
	}
	.carousel-inner > .prev {
	  left: -100%;
	}
	.carousel-inner > .next.left,
	.carousel-inner > .prev.right {
	  left: 0;
	}
	.carousel-inner > .active.left {
	  left: -100%;
	}
	.carousel-inner > .active.right {
	  left: 100%;
	}
	.carousel-control {
	  position: absolute;
	  top: 0;
	  left: 0;
	  bottom: 0;
	  width: 15%;
	  opacity: 0.5;
	  filter: alpha(opacity=50);
	  font-size: 20px;
	  color: #fff;
	  text-align: center;
	  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
	  background-color: rgba(0, 0, 0, 0);
	}
	.carousel-control.left {
	  background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
	  background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
	  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
	  background-repeat: repeat-x;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
	}
	.carousel-control.right {
	  left: auto;
	  right: 0;
	  background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
	  background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
	  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
	  background-repeat: repeat-x;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
	}
	.carousel-control:hover,
	.carousel-control:focus {
	  outline: 0;
	  color: #fff;
	  text-decoration: none;
	  opacity: 0.9;
	  filter: alpha(opacity=90);
	}
	.carousel-control .icon-prev,
	.carousel-control .icon-next,
	.carousel-control .glyphicon-chevron-left,
	.carousel-control .glyphicon-chevron-right {
	  position: absolute;
	  top: 50%;
	  margin-top: -10px;
	  z-index: 5;
	  display: inline-block;
	}
	.carousel-control .icon-prev,
	.carousel-control .glyphicon-chevron-left {
	  left: 50%;
	  margin-left: -10px;
	}
	.carousel-control .icon-next,
	.carousel-control .glyphicon-chevron-right {
	  right: 50%;
	  margin-right: -10px;
	}
	.carousel-control .icon-prev,
	.carousel-control .icon-next {
	  width: 20px;
	  height: 20px;
	  line-height: 1;
	  font-family: serif;
	}
	.carousel-control .icon-prev:before {
	  content: '\2039';
	}
	.carousel-control .icon-next:before {
	  content: '\203a';
	}
	.carousel-indicators {
	  position: absolute;
	  bottom: 10px;
	  left: 50%;
	  z-index: 15;
	  width: 60%;
	  margin-left: -30%;
	  padding-left: 0;
	  list-style: none;
	  text-align: center;
	}
	.carousel-indicators li {
	  display: inline-block;
	  width: 10px;
	  height: 10px;
	  margin: 1px;
	  text-indent: -999px;
	  border: 1px solid #fff;
	  border-radius: 10px;
	  cursor: pointer;
	  background-color: #000 \9;
	  background-color: rgba(0, 0, 0, 0);
	}
	.carousel-indicators .active {
	  margin: 0;
	  width: 12px;
	  height: 12px;
	  background-color: #fff;
	}
	.carousel-caption {
	  position: absolute;
	  left: 15%;
	  right: 15%;
	  bottom: 20px;
	  z-index: 10;
	  padding-top: 20px;
	  padding-bottom: 20px;
	  color: #fff;
	  text-align: center;
	  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
	}
	.carousel-caption .btn {
	  text-shadow: none;
	}
	@media screen and (min-width: 768px) {
	  .carousel-control .glyphicon-chevron-left,
	  .carousel-control .glyphicon-chevron-right,
	  .carousel-control .icon-prev,
	  .carousel-control .icon-next {
	    width: 30px;
	    height: 30px;
	    margin-top: -10px;
	    font-size: 30px;
	  }
	  .carousel-control .glyphicon-chevron-left,
	  .carousel-control .icon-prev {
	    margin-left: -10px;
	  }
	  .carousel-control .glyphicon-chevron-right,
	  .carousel-control .icon-next {
	    margin-right: -10px;
	  }
	  .carousel-caption {
	    left: 20%;
	    right: 20%;
	    padding-bottom: 30px;
	  }
	  .carousel-indicators {
	    bottom: 20px;
	  }
	}
	.clearfix:before,
	.clearfix:after,
	.dl-horizontal dd:before,
	.dl-horizontal dd:after,
	.container:before,
	.container:after,
	.container-fluid:before,
	.container-fluid:after,
	.row:before,
	.row:after,
	.form-horizontal .form-group:before,
	.form-horizontal .form-group:after,
	.btn-toolbar:before,
	.btn-toolbar:after,
	.btn-group-vertical > .btn-group:before,
	.btn-group-vertical > .btn-group:after,
	.nav:before,
	.nav:after,
	.navbar:before,
	.navbar:after,
	.navbar-header:before,
	.navbar-header:after,
	.navbar-collapse:before,
	.navbar-collapse:after,
	.pager:before,
	.pager:after,
	.panel-body:before,
	.panel-body:after,
	.modal-header:before,
	.modal-header:after,
	.modal-footer:before,
	.modal-footer:after,
	.item_buttons:before,
	.item_buttons:after {
	  content: " ";
	  display: table;
	}
	.clearfix:after,
	.dl-horizontal dd:after,
	.container:after,
	.container-fluid:after,
	.row:after,
	.form-horizontal .form-group:after,
	.btn-toolbar:after,
	.btn-group-vertical > .btn-group:after,
	.nav:after,
	.navbar:after,
	.navbar-header:after,
	.navbar-collapse:after,
	.pager:after,
	.panel-body:after,
	.modal-header:after,
	.modal-footer:after,
	.item_buttons:after {
	  clear: both;
	}
	.center-block {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	}
	.pull-right {
	  float: right !important;
	}
	.pull-left {
	  float: left !important;
	}
	.hide {
	  display: none !important;
	}
	.show {
	  display: block !important;
	}
	.invisible {
	  visibility: hidden;
	}
	.text-hide {
	  font: 0/0 a;
	  color: transparent;
	  text-shadow: none;
	  background-color: transparent;
	  border: 0;
	}
	.hidden {
	  display: none !important;
	}
	.affix {
	  position: fixed;
	}
	@-ms-viewport {
	  width: device-width;
	}
	.visible-xs,
	.visible-sm,
	.visible-md,
	.visible-lg {
	  display: none !important;
	}
	.visible-xs-block,
	.visible-xs-inline,
	.visible-xs-inline-block,
	.visible-sm-block,
	.visible-sm-inline,
	.visible-sm-inline-block,
	.visible-md-block,
	.visible-md-inline,
	.visible-md-inline-block,
	.visible-lg-block,
	.visible-lg-inline,
	.visible-lg-inline-block {
	  display: none !important;
	}
	@media (max-width: 767px) {
	  .visible-xs {
	    display: block !important;
	  }
	  table.visible-xs {
	    display: table !important;
	  }
	  tr.visible-xs {
	    display: table-row !important;
	  }
	  th.visible-xs,
	  td.visible-xs {
	    display: table-cell !important;
	  }
	}
	@media (max-width: 767px) {
	  .visible-xs-block {
	    display: block !important;
	  }
	}
	@media (max-width: 767px) {
	  .visible-xs-inline {
	    display: inline !important;
	  }
	}
	@media (max-width: 767px) {
	  .visible-xs-inline-block {
	    display: inline-block !important;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  .visible-sm {
	    display: block !important;
	  }
	  table.visible-sm {
	    display: table !important;
	  }
	  tr.visible-sm {
	    display: table-row !important;
	  }
	  th.visible-sm,
	  td.visible-sm {
	    display: table-cell !important;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  .visible-sm-block {
	    display: block !important;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  .visible-sm-inline {
	    display: inline !important;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  .visible-sm-inline-block {
	    display: inline-block !important;
	  }
	}
	@media (min-width: 992px) and (max-width: 1199px) {
	  .visible-md {
	    display: block !important;
	  }
	  table.visible-md {
	    display: table !important;
	  }
	  tr.visible-md {
	    display: table-row !important;
	  }
	  th.visible-md,
	  td.visible-md {
	    display: table-cell !important;
	  }
	}
	@media (min-width: 992px) and (max-width: 1199px) {
	  .visible-md-block {
	    display: block !important;
	  }
	}
	@media (min-width: 992px) and (max-width: 1199px) {
	  .visible-md-inline {
	    display: inline !important;
	  }
	}
	@media (min-width: 992px) and (max-width: 1199px) {
	  .visible-md-inline-block {
	    display: inline-block !important;
	  }
	}
	@media (min-width: 1200px) {
	  .visible-lg {
	    display: block !important;
	  }
	  table.visible-lg {
	    display: table !important;
	  }
	  tr.visible-lg {
	    display: table-row !important;
	  }
	  th.visible-lg,
	  td.visible-lg {
	    display: table-cell !important;
	  }
	}
	@media (min-width: 1200px) {
	  .visible-lg-block {
	    display: block !important;
	  }
	}
	@media (min-width: 1200px) {
	  .visible-lg-inline {
	    display: inline !important;
	  }
	}
	@media (min-width: 1200px) {
	  .visible-lg-inline-block {
	    display: inline-block !important;
	  }
	}
	@media (max-width: 767px) {
	  .hidden-xs {
	    display: none !important;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  .hidden-sm {
	    display: none !important;
	  }
	}
	@media (min-width: 992px) and (max-width: 1199px) {
	  .hidden-md {
	    display: none !important;
	  }
	}
	@media (min-width: 1200px) {
	  .hidden-lg {
	    display: none !important;
	  }
	}
	.visible-print {
	  display: none !important;
	}
	@media print {
	  .visible-print {
	    display: block !important;
	  }
	  table.visible-print {
	    display: table !important;
	  }
	  tr.visible-print {
	    display: table-row !important;
	  }
	  th.visible-print,
	  td.visible-print {
	    display: table-cell !important;
	  }
	}
	.visible-print-block {
	  display: none !important;
	}
	@media print {
	  .visible-print-block {
	    display: block !important;
	  }
	}
	.visible-print-inline {
	  display: none !important;
	}
	@media print {
	  .visible-print-inline {
	    display: inline !important;
	  }
	}
	.visible-print-inline-block {
	  display: none !important;
	}
	@media print {
	  .visible-print-inline-block {
	    display: inline-block !important;
	  }
	}
	@media print {
	  .hidden-print {
	    display: none !important;
	  }
	}
	/*!
	*
	* Font Awesome
	*
	*/
	/*!
	 *  Font Awesome 4.7.0 by @davegandy - http://fontawesome.io - @fontawesome
	 *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)
	 */
	/* FONT PATH
	 * -------------------------- */
	@font-face {
	  font-family: 'FontAwesome';
	  src: url('../components/font-awesome/fonts/fontawesome-webfont.eot?v=4.7.0');
	  src: url('../components/font-awesome/fonts/fontawesome-webfont.eot?#iefix&v=4.7.0') format('embedded-opentype'), url('../components/font-awesome/fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'), url('../components/font-awesome/fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'), url('../components/font-awesome/fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'), url('../components/font-awesome/fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular') format('svg');
	  font-weight: normal;
	  font-style: normal;
	}
	.fa {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	}
	/* makes the font 33% larger relative to the icon container */
	.fa-lg {
	  font-size: 1.33333333em;
	  line-height: 0.75em;
	  vertical-align: -15%;
	}
	.fa-2x {
	  font-size: 2em;
	}
	.fa-3x {
	  font-size: 3em;
	}
	.fa-4x {
	  font-size: 4em;
	}
	.fa-5x {
	  font-size: 5em;
	}
	.fa-fw {
	  width: 1.28571429em;
	  text-align: center;
	}
	.fa-ul {
	  padding-left: 0;
	  margin-left: 2.14285714em;
	  list-style-type: none;
	}
	.fa-ul > li {
	  position: relative;
	}
	.fa-li {
	  position: absolute;
	  left: -2.14285714em;
	  width: 2.14285714em;
	  top: 0.14285714em;
	  text-align: center;
	}
	.fa-li.fa-lg {
	  left: -1.85714286em;
	}
	.fa-border {
	  padding: .2em .25em .15em;
	  border: solid 0.08em #eee;
	  border-radius: .1em;
	}
	.fa-pull-left {
	  float: left;
	}
	.fa-pull-right {
	  float: right;
	}
	.fa.fa-pull-left {
	  margin-right: .3em;
	}
	.fa.fa-pull-right {
	  margin-left: .3em;
	}
	/* Deprecated as of 4.4.0 */
	.pull-right {
	  float: right;
	}
	.pull-left {
	  float: left;
	}
	.fa.pull-left {
	  margin-right: .3em;
	}
	.fa.pull-right {
	  margin-left: .3em;
	}
	.fa-spin {
	  -webkit-animation: fa-spin 2s infinite linear;
	  animation: fa-spin 2s infinite linear;
	}
	.fa-pulse {
	  -webkit-animation: fa-spin 1s infinite steps(8);
	  animation: fa-spin 1s infinite steps(8);
	}
	@-webkit-keyframes fa-spin {
	  0% {
	    -webkit-transform: rotate(0deg);
	    transform: rotate(0deg);
	  }
	  100% {
	    -webkit-transform: rotate(359deg);
	    transform: rotate(359deg);
	  }
	}
	@keyframes fa-spin {
	  0% {
	    -webkit-transform: rotate(0deg);
	    transform: rotate(0deg);
	  }
	  100% {
	    -webkit-transform: rotate(359deg);
	    transform: rotate(359deg);
	  }
	}
	.fa-rotate-90 {
	  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
	  -webkit-transform: rotate(90deg);
	  -ms-transform: rotate(90deg);
	  transform: rotate(90deg);
	}
	.fa-rotate-180 {
	  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
	  -webkit-transform: rotate(180deg);
	  -ms-transform: rotate(180deg);
	  transform: rotate(180deg);
	}
	.fa-rotate-270 {
	  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
	  -webkit-transform: rotate(270deg);
	  -ms-transform: rotate(270deg);
	  transform: rotate(270deg);
	}
	.fa-flip-horizontal {
	  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1)";
	  -webkit-transform: scale(-1, 1);
	  -ms-transform: scale(-1, 1);
	  transform: scale(-1, 1);
	}
	.fa-flip-vertical {
	  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1)";
	  -webkit-transform: scale(1, -1);
	  -ms-transform: scale(1, -1);
	  transform: scale(1, -1);
	}
	:root .fa-rotate-90,
	:root .fa-rotate-180,
	:root .fa-rotate-270,
	:root .fa-flip-horizontal,
	:root .fa-flip-vertical {
	  filter: none;
	}
	.fa-stack {
	  position: relative;
	  display: inline-block;
	  width: 2em;
	  height: 2em;
	  line-height: 2em;
	  vertical-align: middle;
	}
	.fa-stack-1x,
	.fa-stack-2x {
	  position: absolute;
	  left: 0;
	  width: 100%;
	  text-align: center;
	}
	.fa-stack-1x {
	  line-height: inherit;
	}
	.fa-stack-2x {
	  font-size: 2em;
	}
	.fa-inverse {
	  color: #fff;
	}
	/* Font Awesome uses the Unicode Private Use Area (PUA) to ensure screen
	   readers do not read off random characters that represent icons */
	.fa-glass:before {
	  content: "\f000";
	}
	.fa-music:before {
	  content: "\f001";
	}
	.fa-search:before {
	  content: "\f002";
	}
	.fa-envelope-o:before {
	  content: "\f003";
	}
	.fa-heart:before {
	  content: "\f004";
	}
	.fa-star:before {
	  content: "\f005";
	}
	.fa-star-o:before {
	  content: "\f006";
	}
	.fa-user:before {
	  content: "\f007";
	}
	.fa-film:before {
	  content: "\f008";
	}
	.fa-th-large:before {
	  content: "\f009";
	}
	.fa-th:before {
	  content: "\f00a";
	}
	.fa-th-list:before {
	  content: "\f00b";
	}
	.fa-check:before {
	  content: "\f00c";
	}
	.fa-remove:before,
	.fa-close:before,
	.fa-times:before {
	  content: "\f00d";
	}
	.fa-search-plus:before {
	  content: "\f00e";
	}
	.fa-search-minus:before {
	  content: "\f010";
	}
	.fa-power-off:before {
	  content: "\f011";
	}
	.fa-signal:before {
	  content: "\f012";
	}
	.fa-gear:before,
	.fa-cog:before {
	  content: "\f013";
	}
	.fa-trash-o:before {
	  content: "\f014";
	}
	.fa-home:before {
	  content: "\f015";
	}
	.fa-file-o:before {
	  content: "\f016";
	}
	.fa-clock-o:before {
	  content: "\f017";
	}
	.fa-road:before {
	  content: "\f018";
	}
	.fa-download:before {
	  content: "\f019";
	}
	.fa-arrow-circle-o-down:before {
	  content: "\f01a";
	}
	.fa-arrow-circle-o-up:before {
	  content: "\f01b";
	}
	.fa-inbox:before {
	  content: "\f01c";
	}
	.fa-play-circle-o:before {
	  content: "\f01d";
	}
	.fa-rotate-right:before,
	.fa-repeat:before {
	  content: "\f01e";
	}
	.fa-refresh:before {
	  content: "\f021";
	}
	.fa-list-alt:before {
	  content: "\f022";
	}
	.fa-lock:before {
	  content: "\f023";
	}
	.fa-flag:before {
	  content: "\f024";
	}
	.fa-headphones:before {
	  content: "\f025";
	}
	.fa-volume-off:before {
	  content: "\f026";
	}
	.fa-volume-down:before {
	  content: "\f027";
	}
	.fa-volume-up:before {
	  content: "\f028";
	}
	.fa-qrcode:before {
	  content: "\f029";
	}
	.fa-barcode:before {
	  content: "\f02a";
	}
	.fa-tag:before {
	  content: "\f02b";
	}
	.fa-tags:before {
	  content: "\f02c";
	}
	.fa-book:before {
	  content: "\f02d";
	}
	.fa-bookmark:before {
	  content: "\f02e";
	}
	.fa-print:before {
	  content: "\f02f";
	}
	.fa-camera:before {
	  content: "\f030";
	}
	.fa-font:before {
	  content: "\f031";
	}
	.fa-bold:before {
	  content: "\f032";
	}
	.fa-italic:before {
	  content: "\f033";
	}
	.fa-text-height:before {
	  content: "\f034";
	}
	.fa-text-width:before {
	  content: "\f035";
	}
	.fa-align-left:before {
	  content: "\f036";
	}
	.fa-align-center:before {
	  content: "\f037";
	}
	.fa-align-right:before {
	  content: "\f038";
	}
	.fa-align-justify:before {
	  content: "\f039";
	}
	.fa-list:before {
	  content: "\f03a";
	}
	.fa-dedent:before,
	.fa-outdent:before {
	  content: "\f03b";
	}
	.fa-indent:before {
	  content: "\f03c";
	}
	.fa-video-camera:before {
	  content: "\f03d";
	}
	.fa-photo:before,
	.fa-image:before,
	.fa-picture-o:before {
	  content: "\f03e";
	}
	.fa-pencil:before {
	  content: "\f040";
	}
	.fa-map-marker:before {
	  content: "\f041";
	}
	.fa-adjust:before {
	  content: "\f042";
	}
	.fa-tint:before {
	  content: "\f043";
	}
	.fa-edit:before,
	.fa-pencil-square-o:before {
	  content: "\f044";
	}
	.fa-share-square-o:before {
	  content: "\f045";
	}
	.fa-check-square-o:before {
	  content: "\f046";
	}
	.fa-arrows:before {
	  content: "\f047";
	}
	.fa-step-backward:before {
	  content: "\f048";
	}
	.fa-fast-backward:before {
	  content: "\f049";
	}
	.fa-backward:before {
	  content: "\f04a";
	}
	.fa-play:before {
	  content: "\f04b";
	}
	.fa-pause:before {
	  content: "\f04c";
	}
	.fa-stop:before {
	  content: "\f04d";
	}
	.fa-forward:before {
	  content: "\f04e";
	}
	.fa-fast-forward:before {
	  content: "\f050";
	}
	.fa-step-forward:before {
	  content: "\f051";
	}
	.fa-eject:before {
	  content: "\f052";
	}
	.fa-chevron-left:before {
	  content: "\f053";
	}
	.fa-chevron-right:before {
	  content: "\f054";
	}
	.fa-plus-circle:before {
	  content: "\f055";
	}
	.fa-minus-circle:before {
	  content: "\f056";
	}
	.fa-times-circle:before {
	  content: "\f057";
	}
	.fa-check-circle:before {
	  content: "\f058";
	}
	.fa-question-circle:before {
	  content: "\f059";
	}
	.fa-info-circle:before {
	  content: "\f05a";
	}
	.fa-crosshairs:before {
	  content: "\f05b";
	}
	.fa-times-circle-o:before {
	  content: "\f05c";
	}
	.fa-check-circle-o:before {
	  content: "\f05d";
	}
	.fa-ban:before {
	  content: "\f05e";
	}
	.fa-arrow-left:before {
	  content: "\f060";
	}
	.fa-arrow-right:before {
	  content: "\f061";
	}
	.fa-arrow-up:before {
	  content: "\f062";
	}
	.fa-arrow-down:before {
	  content: "\f063";
	}
	.fa-mail-forward:before,
	.fa-share:before {
	  content: "\f064";
	}
	.fa-expand:before {
	  content: "\f065";
	}
	.fa-compress:before {
	  content: "\f066";
	}
	.fa-plus:before {
	  content: "\f067";
	}
	.fa-minus:before {
	  content: "\f068";
	}
	.fa-asterisk:before {
	  content: "\f069";
	}
	.fa-exclamation-circle:before {
	  content: "\f06a";
	}
	.fa-gift:before {
	  content: "\f06b";
	}
	.fa-leaf:before {
	  content: "\f06c";
	}
	.fa-fire:before {
	  content: "\f06d";
	}
	.fa-eye:before {
	  content: "\f06e";
	}
	.fa-eye-slash:before {
	  content: "\f070";
	}
	.fa-warning:before,
	.fa-exclamation-triangle:before {
	  content: "\f071";
	}
	.fa-plane:before {
	  content: "\f072";
	}
	.fa-calendar:before {
	  content: "\f073";
	}
	.fa-random:before {
	  content: "\f074";
	}
	.fa-comment:before {
	  content: "\f075";
	}
	.fa-magnet:before {
	  content: "\f076";
	}
	.fa-chevron-up:before {
	  content: "\f077";
	}
	.fa-chevron-down:before {
	  content: "\f078";
	}
	.fa-retweet:before {
	  content: "\f079";
	}
	.fa-shopping-cart:before {
	  content: "\f07a";
	}
	.fa-folder:before {
	  content: "\f07b";
	}
	.fa-folder-open:before {
	  content: "\f07c";
	}
	.fa-arrows-v:before {
	  content: "\f07d";
	}
	.fa-arrows-h:before {
	  content: "\f07e";
	}
	.fa-bar-chart-o:before,
	.fa-bar-chart:before {
	  content: "\f080";
	}
	.fa-twitter-square:before {
	  content: "\f081";
	}
	.fa-facebook-square:before {
	  content: "\f082";
	}
	.fa-camera-retro:before {
	  content: "\f083";
	}
	.fa-key:before {
	  content: "\f084";
	}
	.fa-gears:before,
	.fa-cogs:before {
	  content: "\f085";
	}
	.fa-comments:before {
	  content: "\f086";
	}
	.fa-thumbs-o-up:before {
	  content: "\f087";
	}
	.fa-thumbs-o-down:before {
	  content: "\f088";
	}
	.fa-star-half:before {
	  content: "\f089";
	}
	.fa-heart-o:before {
	  content: "\f08a";
	}
	.fa-sign-out:before {
	  content: "\f08b";
	}
	.fa-linkedin-square:before {
	  content: "\f08c";
	}
	.fa-thumb-tack:before {
	  content: "\f08d";
	}
	.fa-external-link:before {
	  content: "\f08e";
	}
	.fa-sign-in:before {
	  content: "\f090";
	}
	.fa-trophy:before {
	  content: "\f091";
	}
	.fa-github-square:before {
	  content: "\f092";
	}
	.fa-upload:before {
	  content: "\f093";
	}
	.fa-lemon-o:before {
	  content: "\f094";
	}
	.fa-phone:before {
	  content: "\f095";
	}
	.fa-square-o:before {
	  content: "\f096";
	}
	.fa-bookmark-o:before {
	  content: "\f097";
	}
	.fa-phone-square:before {
	  content: "\f098";
	}
	.fa-twitter:before {
	  content: "\f099";
	}
	.fa-facebook-f:before,
	.fa-facebook:before {
	  content: "\f09a";
	}
	.fa-github:before {
	  content: "\f09b";
	}
	.fa-unlock:before {
	  content: "\f09c";
	}
	.fa-credit-card:before {
	  content: "\f09d";
	}
	.fa-feed:before,
	.fa-rss:before {
	  content: "\f09e";
	}
	.fa-hdd-o:before {
	  content: "\f0a0";
	}
	.fa-bullhorn:before {
	  content: "\f0a1";
	}
	.fa-bell:before {
	  content: "\f0f3";
	}
	.fa-certificate:before {
	  content: "\f0a3";
	}
	.fa-hand-o-right:before {
	  content: "\f0a4";
	}
	.fa-hand-o-left:before {
	  content: "\f0a5";
	}
	.fa-hand-o-up:before {
	  content: "\f0a6";
	}
	.fa-hand-o-down:before {
	  content: "\f0a7";
	}
	.fa-arrow-circle-left:before {
	  content: "\f0a8";
	}
	.fa-arrow-circle-right:before {
	  content: "\f0a9";
	}
	.fa-arrow-circle-up:before {
	  content: "\f0aa";
	}
	.fa-arrow-circle-down:before {
	  content: "\f0ab";
	}
	.fa-globe:before {
	  content: "\f0ac";
	}
	.fa-wrench:before {
	  content: "\f0ad";
	}
	.fa-tasks:before {
	  content: "\f0ae";
	}
	.fa-filter:before {
	  content: "\f0b0";
	}
	.fa-briefcase:before {
	  content: "\f0b1";
	}
	.fa-arrows-alt:before {
	  content: "\f0b2";
	}
	.fa-group:before,
	.fa-users:before {
	  content: "\f0c0";
	}
	.fa-chain:before,
	.fa-link:before {
	  content: "\f0c1";
	}
	.fa-cloud:before {
	  content: "\f0c2";
	}
	.fa-flask:before {
	  content: "\f0c3";
	}
	.fa-cut:before,
	.fa-scissors:before {
	  content: "\f0c4";
	}
	.fa-copy:before,
	.fa-files-o:before {
	  content: "\f0c5";
	}
	.fa-paperclip:before {
	  content: "\f0c6";
	}
	.fa-save:before,
	.fa-floppy-o:before {
	  content: "\f0c7";
	}
	.fa-square:before {
	  content: "\f0c8";
	}
	.fa-navicon:before,
	.fa-reorder:before,
	.fa-bars:before {
	  content: "\f0c9";
	}
	.fa-list-ul:before {
	  content: "\f0ca";
	}
	.fa-list-ol:before {
	  content: "\f0cb";
	}
	.fa-strikethrough:before {
	  content: "\f0cc";
	}
	.fa-underline:before {
	  content: "\f0cd";
	}
	.fa-table:before {
	  content: "\f0ce";
	}
	.fa-magic:before {
	  content: "\f0d0";
	}
	.fa-truck:before {
	  content: "\f0d1";
	}
	.fa-pinterest:before {
	  content: "\f0d2";
	}
	.fa-pinterest-square:before {
	  content: "\f0d3";
	}
	.fa-google-plus-square:before {
	  content: "\f0d4";
	}
	.fa-google-plus:before {
	  content: "\f0d5";
	}
	.fa-money:before {
	  content: "\f0d6";
	}
	.fa-caret-down:before {
	  content: "\f0d7";
	}
	.fa-caret-up:before {
	  content: "\f0d8";
	}
	.fa-caret-left:before {
	  content: "\f0d9";
	}
	.fa-caret-right:before {
	  content: "\f0da";
	}
	.fa-columns:before {
	  content: "\f0db";
	}
	.fa-unsorted:before,
	.fa-sort:before {
	  content: "\f0dc";
	}
	.fa-sort-down:before,
	.fa-sort-desc:before {
	  content: "\f0dd";
	}
	.fa-sort-up:before,
	.fa-sort-asc:before {
	  content: "\f0de";
	}
	.fa-envelope:before {
	  content: "\f0e0";
	}
	.fa-linkedin:before {
	  content: "\f0e1";
	}
	.fa-rotate-left:before,
	.fa-undo:before {
	  content: "\f0e2";
	}
	.fa-legal:before,
	.fa-gavel:before {
	  content: "\f0e3";
	}
	.fa-dashboard:before,
	.fa-tachometer:before {
	  content: "\f0e4";
	}
	.fa-comment-o:before {
	  content: "\f0e5";
	}
	.fa-comments-o:before {
	  content: "\f0e6";
	}
	.fa-flash:before,
	.fa-bolt:before {
	  content: "\f0e7";
	}
	.fa-sitemap:before {
	  content: "\f0e8";
	}
	.fa-umbrella:before {
	  content: "\f0e9";
	}
	.fa-paste:before,
	.fa-clipboard:before {
	  content: "\f0ea";
	}
	.fa-lightbulb-o:before {
	  content: "\f0eb";
	}
	.fa-exchange:before {
	  content: "\f0ec";
	}
	.fa-cloud-download:before {
	  content: "\f0ed";
	}
	.fa-cloud-upload:before {
	  content: "\f0ee";
	}
	.fa-user-md:before {
	  content: "\f0f0";
	}
	.fa-stethoscope:before {
	  content: "\f0f1";
	}
	.fa-suitcase:before {
	  content: "\f0f2";
	}
	.fa-bell-o:before {
	  content: "\f0a2";
	}
	.fa-coffee:before {
	  content: "\f0f4";
	}
	.fa-cutlery:before {
	  content: "\f0f5";
	}
	.fa-file-text-o:before {
	  content: "\f0f6";
	}
	.fa-building-o:before {
	  content: "\f0f7";
	}
	.fa-hospital-o:before {
	  content: "\f0f8";
	}
	.fa-ambulance:before {
	  content: "\f0f9";
	}
	.fa-medkit:before {
	  content: "\f0fa";
	}
	.fa-fighter-jet:before {
	  content: "\f0fb";
	}
	.fa-beer:before {
	  content: "\f0fc";
	}
	.fa-h-square:before {
	  content: "\f0fd";
	}
	.fa-plus-square:before {
	  content: "\f0fe";
	}
	.fa-angle-double-left:before {
	  content: "\f100";
	}
	.fa-angle-double-right:before {
	  content: "\f101";
	}
	.fa-angle-double-up:before {
	  content: "\f102";
	}
	.fa-angle-double-down:before {
	  content: "\f103";
	}
	.fa-angle-left:before {
	  content: "\f104";
	}
	.fa-angle-right:before {
	  content: "\f105";
	}
	.fa-angle-up:before {
	  content: "\f106";
	}
	.fa-angle-down:before {
	  content: "\f107";
	}
	.fa-desktop:before {
	  content: "\f108";
	}
	.fa-laptop:before {
	  content: "\f109";
	}
	.fa-tablet:before {
	  content: "\f10a";
	}
	.fa-mobile-phone:before,
	.fa-mobile:before {
	  content: "\f10b";
	}
	.fa-circle-o:before {
	  content: "\f10c";
	}
	.fa-quote-left:before {
	  content: "\f10d";
	}
	.fa-quote-right:before {
	  content: "\f10e";
	}
	.fa-spinner:before {
	  content: "\f110";
	}
	.fa-circle:before {
	  content: "\f111";
	}
	.fa-mail-reply:before,
	.fa-reply:before {
	  content: "\f112";
	}
	.fa-github-alt:before {
	  content: "\f113";
	}
	.fa-folder-o:before {
	  content: "\f114";
	}
	.fa-folder-open-o:before {
	  content: "\f115";
	}
	.fa-smile-o:before {
	  content: "\f118";
	}
	.fa-frown-o:before {
	  content: "\f119";
	}
	.fa-meh-o:before {
	  content: "\f11a";
	}
	.fa-gamepad:before {
	  content: "\f11b";
	}
	.fa-keyboard-o:before {
	  content: "\f11c";
	}
	.fa-flag-o:before {
	  content: "\f11d";
	}
	.fa-flag-checkered:before {
	  content: "\f11e";
	}
	.fa-terminal:before {
	  content: "\f120";
	}
	.fa-code:before {
	  content: "\f121";
	}
	.fa-mail-reply-all:before,
	.fa-reply-all:before {
	  content: "\f122";
	}
	.fa-star-half-empty:before,
	.fa-star-half-full:before,
	.fa-star-half-o:before {
	  content: "\f123";
	}
	.fa-location-arrow:before {
	  content: "\f124";
	}
	.fa-crop:before {
	  content: "\f125";
	}
	.fa-code-fork:before {
	  content: "\f126";
	}
	.fa-unlink:before,
	.fa-chain-broken:before {
	  content: "\f127";
	}
	.fa-question:before {
	  content: "\f128";
	}
	.fa-info:before {
	  content: "\f129";
	}
	.fa-exclamation:before {
	  content: "\f12a";
	}
	.fa-superscript:before {
	  content: "\f12b";
	}
	.fa-subscript:before {
	  content: "\f12c";
	}
	.fa-eraser:before {
	  content: "\f12d";
	}
	.fa-puzzle-piece:before {
	  content: "\f12e";
	}
	.fa-microphone:before {
	  content: "\f130";
	}
	.fa-microphone-slash:before {
	  content: "\f131";
	}
	.fa-shield:before {
	  content: "\f132";
	}
	.fa-calendar-o:before {
	  content: "\f133";
	}
	.fa-fire-extinguisher:before {
	  content: "\f134";
	}
	.fa-rocket:before {
	  content: "\f135";
	}
	.fa-maxcdn:before {
	  content: "\f136";
	}
	.fa-chevron-circle-left:before {
	  content: "\f137";
	}
	.fa-chevron-circle-right:before {
	  content: "\f138";
	}
	.fa-chevron-circle-up:before {
	  content: "\f139";
	}
	.fa-chevron-circle-down:before {
	  content: "\f13a";
	}
	.fa-html5:before {
	  content: "\f13b";
	}
	.fa-css3:before {
	  content: "\f13c";
	}
	.fa-anchor:before {
	  content: "\f13d";
	}
	.fa-unlock-alt:before {
	  content: "\f13e";
	}
	.fa-bullseye:before {
	  content: "\f140";
	}
	.fa-ellipsis-h:before {
	  content: "\f141";
	}
	.fa-ellipsis-v:before {
	  content: "\f142";
	}
	.fa-rss-square:before {
	  content: "\f143";
	}
	.fa-play-circle:before {
	  content: "\f144";
	}
	.fa-ticket:before {
	  content: "\f145";
	}
	.fa-minus-square:before {
	  content: "\f146";
	}
	.fa-minus-square-o:before {
	  content: "\f147";
	}
	.fa-level-up:before {
	  content: "\f148";
	}
	.fa-level-down:before {
	  content: "\f149";
	}
	.fa-check-square:before {
	  content: "\f14a";
	}
	.fa-pencil-square:before {
	  content: "\f14b";
	}
	.fa-external-link-square:before {
	  content: "\f14c";
	}
	.fa-share-square:before {
	  content: "\f14d";
	}
	.fa-compass:before {
	  content: "\f14e";
	}
	.fa-toggle-down:before,
	.fa-caret-square-o-down:before {
	  content: "\f150";
	}
	.fa-toggle-up:before,
	.fa-caret-square-o-up:before {
	  content: "\f151";
	}
	.fa-toggle-right:before,
	.fa-caret-square-o-right:before {
	  content: "\f152";
	}
	.fa-euro:before,
	.fa-eur:before {
	  content: "\f153";
	}
	.fa-gbp:before {
	  content: "\f154";
	}
	.fa-dollar:before,
	.fa-usd:before {
	  content: "\f155";
	}
	.fa-rupee:before,
	.fa-inr:before {
	  content: "\f156";
	}
	.fa-cny:before,
	.fa-rmb:before,
	.fa-yen:before,
	.fa-jpy:before {
	  content: "\f157";
	}
	.fa-ruble:before,
	.fa-rouble:before,
	.fa-rub:before {
	  content: "\f158";
	}
	.fa-won:before,
	.fa-krw:before {
	  content: "\f159";
	}
	.fa-bitcoin:before,
	.fa-btc:before {
	  content: "\f15a";
	}
	.fa-file:before {
	  content: "\f15b";
	}
	.fa-file-text:before {
	  content: "\f15c";
	}
	.fa-sort-alpha-asc:before {
	  content: "\f15d";
	}
	.fa-sort-alpha-desc:before {
	  content: "\f15e";
	}
	.fa-sort-amount-asc:before {
	  content: "\f160";
	}
	.fa-sort-amount-desc:before {
	  content: "\f161";
	}
	.fa-sort-numeric-asc:before {
	  content: "\f162";
	}
	.fa-sort-numeric-desc:before {
	  content: "\f163";
	}
	.fa-thumbs-up:before {
	  content: "\f164";
	}
	.fa-thumbs-down:before {
	  content: "\f165";
	}
	.fa-youtube-square:before {
	  content: "\f166";
	}
	.fa-youtube:before {
	  content: "\f167";
	}
	.fa-xing:before {
	  content: "\f168";
	}
	.fa-xing-square:before {
	  content: "\f169";
	}
	.fa-youtube-play:before {
	  content: "\f16a";
	}
	.fa-dropbox:before {
	  content: "\f16b";
	}
	.fa-stack-overflow:before {
	  content: "\f16c";
	}
	.fa-instagram:before {
	  content: "\f16d";
	}
	.fa-flickr:before {
	  content: "\f16e";
	}
	.fa-adn:before {
	  content: "\f170";
	}
	.fa-bitbucket:before {
	  content: "\f171";
	}
	.fa-bitbucket-square:before {
	  content: "\f172";
	}
	.fa-tumblr:before {
	  content: "\f173";
	}
	.fa-tumblr-square:before {
	  content: "\f174";
	}
	.fa-long-arrow-down:before {
	  content: "\f175";
	}
	.fa-long-arrow-up:before {
	  content: "\f176";
	}
	.fa-long-arrow-left:before {
	  content: "\f177";
	}
	.fa-long-arrow-right:before {
	  content: "\f178";
	}
	.fa-apple:before {
	  content: "\f179";
	}
	.fa-windows:before {
	  content: "\f17a";
	}
	.fa-android:before {
	  content: "\f17b";
	}
	.fa-linux:before {
	  content: "\f17c";
	}
	.fa-dribbble:before {
	  content: "\f17d";
	}
	.fa-skype:before {
	  content: "\f17e";
	}
	.fa-foursquare:before {
	  content: "\f180";
	}
	.fa-trello:before {
	  content: "\f181";
	}
	.fa-female:before {
	  content: "\f182";
	}
	.fa-male:before {
	  content: "\f183";
	}
	.fa-gittip:before,
	.fa-gratipay:before {
	  content: "\f184";
	}
	.fa-sun-o:before {
	  content: "\f185";
	}
	.fa-moon-o:before {
	  content: "\f186";
	}
	.fa-archive:before {
	  content: "\f187";
	}
	.fa-bug:before {
	  content: "\f188";
	}
	.fa-vk:before {
	  content: "\f189";
	}
	.fa-weibo:before {
	  content: "\f18a";
	}
	.fa-renren:before {
	  content: "\f18b";
	}
	.fa-pagelines:before {
	  content: "\f18c";
	}
	.fa-stack-exchange:before {
	  content: "\f18d";
	}
	.fa-arrow-circle-o-right:before {
	  content: "\f18e";
	}
	.fa-arrow-circle-o-left:before {
	  content: "\f190";
	}
	.fa-toggle-left:before,
	.fa-caret-square-o-left:before {
	  content: "\f191";
	}
	.fa-dot-circle-o:before {
	  content: "\f192";
	}
	.fa-wheelchair:before {
	  content: "\f193";
	}
	.fa-vimeo-square:before {
	  content: "\f194";
	}
	.fa-turkish-lira:before,
	.fa-try:before {
	  content: "\f195";
	}
	.fa-plus-square-o:before {
	  content: "\f196";
	}
	.fa-space-shuttle:before {
	  content: "\f197";
	}
	.fa-slack:before {
	  content: "\f198";
	}
	.fa-envelope-square:before {
	  content: "\f199";
	}
	.fa-wordpress:before {
	  content: "\f19a";
	}
	.fa-openid:before {
	  content: "\f19b";
	}
	.fa-institution:before,
	.fa-bank:before,
	.fa-university:before {
	  content: "\f19c";
	}
	.fa-mortar-board:before,
	.fa-graduation-cap:before {
	  content: "\f19d";
	}
	.fa-yahoo:before {
	  content: "\f19e";
	}
	.fa-google:before {
	  content: "\f1a0";
	}
	.fa-reddit:before {
	  content: "\f1a1";
	}
	.fa-reddit-square:before {
	  content: "\f1a2";
	}
	.fa-stumbleupon-circle:before {
	  content: "\f1a3";
	}
	.fa-stumbleupon:before {
	  content: "\f1a4";
	}
	.fa-delicious:before {
	  content: "\f1a5";
	}
	.fa-digg:before {
	  content: "\f1a6";
	}
	.fa-pied-piper-pp:before {
	  content: "\f1a7";
	}
	.fa-pied-piper-alt:before {
	  content: "\f1a8";
	}
	.fa-drupal:before {
	  content: "\f1a9";
	}
	.fa-joomla:before {
	  content: "\f1aa";
	}
	.fa-language:before {
	  content: "\f1ab";
	}
	.fa-fax:before {
	  content: "\f1ac";
	}
	.fa-building:before {
	  content: "\f1ad";
	}
	.fa-child:before {
	  content: "\f1ae";
	}
	.fa-paw:before {
	  content: "\f1b0";
	}
	.fa-spoon:before {
	  content: "\f1b1";
	}
	.fa-cube:before {
	  content: "\f1b2";
	}
	.fa-cubes:before {
	  content: "\f1b3";
	}
	.fa-behance:before {
	  content: "\f1b4";
	}
	.fa-behance-square:before {
	  content: "\f1b5";
	}
	.fa-steam:before {
	  content: "\f1b6";
	}
	.fa-steam-square:before {
	  content: "\f1b7";
	}
	.fa-recycle:before {
	  content: "\f1b8";
	}
	.fa-automobile:before,
	.fa-car:before {
	  content: "\f1b9";
	}
	.fa-cab:before,
	.fa-taxi:before {
	  content: "\f1ba";
	}
	.fa-tree:before {
	  content: "\f1bb";
	}
	.fa-spotify:before {
	  content: "\f1bc";
	}
	.fa-deviantart:before {
	  content: "\f1bd";
	}
	.fa-soundcloud:before {
	  content: "\f1be";
	}
	.fa-database:before {
	  content: "\f1c0";
	}
	.fa-file-pdf-o:before {
	  content: "\f1c1";
	}
	.fa-file-word-o:before {
	  content: "\f1c2";
	}
	.fa-file-excel-o:before {
	  content: "\f1c3";
	}
	.fa-file-powerpoint-o:before {
	  content: "\f1c4";
	}
	.fa-file-photo-o:before,
	.fa-file-picture-o:before,
	.fa-file-image-o:before {
	  content: "\f1c5";
	}
	.fa-file-zip-o:before,
	.fa-file-archive-o:before {
	  content: "\f1c6";
	}
	.fa-file-sound-o:before,
	.fa-file-audio-o:before {
	  content: "\f1c7";
	}
	.fa-file-movie-o:before,
	.fa-file-video-o:before {
	  content: "\f1c8";
	}
	.fa-file-code-o:before {
	  content: "\f1c9";
	}
	.fa-vine:before {
	  content: "\f1ca";
	}
	.fa-codepen:before {
	  content: "\f1cb";
	}
	.fa-jsfiddle:before {
	  content: "\f1cc";
	}
	.fa-life-bouy:before,
	.fa-life-buoy:before,
	.fa-life-saver:before,
	.fa-support:before,
	.fa-life-ring:before {
	  content: "\f1cd";
	}
	.fa-circle-o-notch:before {
	  content: "\f1ce";
	}
	.fa-ra:before,
	.fa-resistance:before,
	.fa-rebel:before {
	  content: "\f1d0";
	}
	.fa-ge:before,
	.fa-empire:before {
	  content: "\f1d1";
	}
	.fa-git-square:before {
	  content: "\f1d2";
	}
	.fa-git:before {
	  content: "\f1d3";
	}
	.fa-y-combinator-square:before,
	.fa-yc-square:before,
	.fa-hacker-news:before {
	  content: "\f1d4";
	}
	.fa-tencent-weibo:before {
	  content: "\f1d5";
	}
	.fa-qq:before {
	  content: "\f1d6";
	}
	.fa-wechat:before,
	.fa-weixin:before {
	  content: "\f1d7";
	}
	.fa-send:before,
	.fa-paper-plane:before {
	  content: "\f1d8";
	}
	.fa-send-o:before,
	.fa-paper-plane-o:before {
	  content: "\f1d9";
	}
	.fa-history:before {
	  content: "\f1da";
	}
	.fa-circle-thin:before {
	  content: "\f1db";
	}
	.fa-header:before {
	  content: "\f1dc";
	}
	.fa-paragraph:before {
	  content: "\f1dd";
	}
	.fa-sliders:before {
	  content: "\f1de";
	}
	.fa-share-alt:before {
	  content: "\f1e0";
	}
	.fa-share-alt-square:before {
	  content: "\f1e1";
	}
	.fa-bomb:before {
	  content: "\f1e2";
	}
	.fa-soccer-ball-o:before,
	.fa-futbol-o:before {
	  content: "\f1e3";
	}
	.fa-tty:before {
	  content: "\f1e4";
	}
	.fa-binoculars:before {
	  content: "\f1e5";
	}
	.fa-plug:before {
	  content: "\f1e6";
	}
	.fa-slideshare:before {
	  content: "\f1e7";
	}
	.fa-twitch:before {
	  content: "\f1e8";
	}
	.fa-yelp:before {
	  content: "\f1e9";
	}
	.fa-newspaper-o:before {
	  content: "\f1ea";
	}
	.fa-wifi:before {
	  content: "\f1eb";
	}
	.fa-calculator:before {
	  content: "\f1ec";
	}
	.fa-paypal:before {
	  content: "\f1ed";
	}
	.fa-google-wallet:before {
	  content: "\f1ee";
	}
	.fa-cc-visa:before {
	  content: "\f1f0";
	}
	.fa-cc-mastercard:before {
	  content: "\f1f1";
	}
	.fa-cc-discover:before {
	  content: "\f1f2";
	}
	.fa-cc-amex:before {
	  content: "\f1f3";
	}
	.fa-cc-paypal:before {
	  content: "\f1f4";
	}
	.fa-cc-stripe:before {
	  content: "\f1f5";
	}
	.fa-bell-slash:before {
	  content: "\f1f6";
	}
	.fa-bell-slash-o:before {
	  content: "\f1f7";
	}
	.fa-trash:before {
	  content: "\f1f8";
	}
	.fa-copyright:before {
	  content: "\f1f9";
	}
	.fa-at:before {
	  content: "\f1fa";
	}
	.fa-eyedropper:before {
	  content: "\f1fb";
	}
	.fa-paint-brush:before {
	  content: "\f1fc";
	}
	.fa-birthday-cake:before {
	  content: "\f1fd";
	}
	.fa-area-chart:before {
	  content: "\f1fe";
	}
	.fa-pie-chart:before {
	  content: "\f200";
	}
	.fa-line-chart:before {
	  content: "\f201";
	}
	.fa-lastfm:before {
	  content: "\f202";
	}
	.fa-lastfm-square:before {
	  content: "\f203";
	}
	.fa-toggle-off:before {
	  content: "\f204";
	}
	.fa-toggle-on:before {
	  content: "\f205";
	}
	.fa-bicycle:before {
	  content: "\f206";
	}
	.fa-bus:before {
	  content: "\f207";
	}
	.fa-ioxhost:before {
	  content: "\f208";
	}
	.fa-angellist:before {
	  content: "\f209";
	}
	.fa-cc:before {
	  content: "\f20a";
	}
	.fa-shekel:before,
	.fa-sheqel:before,
	.fa-ils:before {
	  content: "\f20b";
	}
	.fa-meanpath:before {
	  content: "\f20c";
	}
	.fa-buysellads:before {
	  content: "\f20d";
	}
	.fa-connectdevelop:before {
	  content: "\f20e";
	}
	.fa-dashcube:before {
	  content: "\f210";
	}
	.fa-forumbee:before {
	  content: "\f211";
	}
	.fa-leanpub:before {
	  content: "\f212";
	}
	.fa-sellsy:before {
	  content: "\f213";
	}
	.fa-shirtsinbulk:before {
	  content: "\f214";
	}
	.fa-simplybuilt:before {
	  content: "\f215";
	}
	.fa-skyatlas:before {
	  content: "\f216";
	}
	.fa-cart-plus:before {
	  content: "\f217";
	}
	.fa-cart-arrow-down:before {
	  content: "\f218";
	}
	.fa-diamond:before {
	  content: "\f219";
	}
	.fa-ship:before {
	  content: "\f21a";
	}
	.fa-user-secret:before {
	  content: "\f21b";
	}
	.fa-motorcycle:before {
	  content: "\f21c";
	}
	.fa-street-view:before {
	  content: "\f21d";
	}
	.fa-heartbeat:before {
	  content: "\f21e";
	}
	.fa-venus:before {
	  content: "\f221";
	}
	.fa-mars:before {
	  content: "\f222";
	}
	.fa-mercury:before {
	  content: "\f223";
	}
	.fa-intersex:before,
	.fa-transgender:before {
	  content: "\f224";
	}
	.fa-transgender-alt:before {
	  content: "\f225";
	}
	.fa-venus-double:before {
	  content: "\f226";
	}
	.fa-mars-double:before {
	  content: "\f227";
	}
	.fa-venus-mars:before {
	  content: "\f228";
	}
	.fa-mars-stroke:before {
	  content: "\f229";
	}
	.fa-mars-stroke-v:before {
	  content: "\f22a";
	}
	.fa-mars-stroke-h:before {
	  content: "\f22b";
	}
	.fa-neuter:before {
	  content: "\f22c";
	}
	.fa-genderless:before {
	  content: "\f22d";
	}
	.fa-facebook-official:before {
	  content: "\f230";
	}
	.fa-pinterest-p:before {
	  content: "\f231";
	}
	.fa-whatsapp:before {
	  content: "\f232";
	}
	.fa-server:before {
	  content: "\f233";
	}
	.fa-user-plus:before {
	  content: "\f234";
	}
	.fa-user-times:before {
	  content: "\f235";
	}
	.fa-hotel:before,
	.fa-bed:before {
	  content: "\f236";
	}
	.fa-viacoin:before {
	  content: "\f237";
	}
	.fa-train:before {
	  content: "\f238";
	}
	.fa-subway:before {
	  content: "\f239";
	}
	.fa-medium:before {
	  content: "\f23a";
	}
	.fa-yc:before,
	.fa-y-combinator:before {
	  content: "\f23b";
	}
	.fa-optin-monster:before {
	  content: "\f23c";
	}
	.fa-opencart:before {
	  content: "\f23d";
	}
	.fa-expeditedssl:before {
	  content: "\f23e";
	}
	.fa-battery-4:before,
	.fa-battery:before,
	.fa-battery-full:before {
	  content: "\f240";
	}
	.fa-battery-3:before,
	.fa-battery-three-quarters:before {
	  content: "\f241";
	}
	.fa-battery-2:before,
	.fa-battery-half:before {
	  content: "\f242";
	}
	.fa-battery-1:before,
	.fa-battery-quarter:before {
	  content: "\f243";
	}
	.fa-battery-0:before,
	.fa-battery-empty:before {
	  content: "\f244";
	}
	.fa-mouse-pointer:before {
	  content: "\f245";
	}
	.fa-i-cursor:before {
	  content: "\f246";
	}
	.fa-object-group:before {
	  content: "\f247";
	}
	.fa-object-ungroup:before {
	  content: "\f248";
	}
	.fa-sticky-note:before {
	  content: "\f249";
	}
	.fa-sticky-note-o:before {
	  content: "\f24a";
	}
	.fa-cc-jcb:before {
	  content: "\f24b";
	}
	.fa-cc-diners-club:before {
	  content: "\f24c";
	}
	.fa-clone:before {
	  content: "\f24d";
	}
	.fa-balance-scale:before {
	  content: "\f24e";
	}
	.fa-hourglass-o:before {
	  content: "\f250";
	}
	.fa-hourglass-1:before,
	.fa-hourglass-start:before {
	  content: "\f251";
	}
	.fa-hourglass-2:before,
	.fa-hourglass-half:before {
	  content: "\f252";
	}
	.fa-hourglass-3:before,
	.fa-hourglass-end:before {
	  content: "\f253";
	}
	.fa-hourglass:before {
	  content: "\f254";
	}
	.fa-hand-grab-o:before,
	.fa-hand-rock-o:before {
	  content: "\f255";
	}
	.fa-hand-stop-o:before,
	.fa-hand-paper-o:before {
	  content: "\f256";
	}
	.fa-hand-scissors-o:before {
	  content: "\f257";
	}
	.fa-hand-lizard-o:before {
	  content: "\f258";
	}
	.fa-hand-spock-o:before {
	  content: "\f259";
	}
	.fa-hand-pointer-o:before {
	  content: "\f25a";
	}
	.fa-hand-peace-o:before {
	  content: "\f25b";
	}
	.fa-trademark:before {
	  content: "\f25c";
	}
	.fa-registered:before {
	  content: "\f25d";
	}
	.fa-creative-commons:before {
	  content: "\f25e";
	}
	.fa-gg:before {
	  content: "\f260";
	}
	.fa-gg-circle:before {
	  content: "\f261";
	}
	.fa-tripadvisor:before {
	  content: "\f262";
	}
	.fa-odnoklassniki:before {
	  content: "\f263";
	}
	.fa-odnoklassniki-square:before {
	  content: "\f264";
	}
	.fa-get-pocket:before {
	  content: "\f265";
	}
	.fa-wikipedia-w:before {
	  content: "\f266";
	}
	.fa-safari:before {
	  content: "\f267";
	}
	.fa-chrome:before {
	  content: "\f268";
	}
	.fa-firefox:before {
	  content: "\f269";
	}
	.fa-opera:before {
	  content: "\f26a";
	}
	.fa-internet-explorer:before {
	  content: "\f26b";
	}
	.fa-tv:before,
	.fa-television:before {
	  content: "\f26c";
	}
	.fa-contao:before {
	  content: "\f26d";
	}
	.fa-500px:before {
	  content: "\f26e";
	}
	.fa-amazon:before {
	  content: "\f270";
	}
	.fa-calendar-plus-o:before {
	  content: "\f271";
	}
	.fa-calendar-minus-o:before {
	  content: "\f272";
	}
	.fa-calendar-times-o:before {
	  content: "\f273";
	}
	.fa-calendar-check-o:before {
	  content: "\f274";
	}
	.fa-industry:before {
	  content: "\f275";
	}
	.fa-map-pin:before {
	  content: "\f276";
	}
	.fa-map-signs:before {
	  content: "\f277";
	}
	.fa-map-o:before {
	  content: "\f278";
	}
	.fa-map:before {
	  content: "\f279";
	}
	.fa-commenting:before {
	  content: "\f27a";
	}
	.fa-commenting-o:before {
	  content: "\f27b";
	}
	.fa-houzz:before {
	  content: "\f27c";
	}
	.fa-vimeo:before {
	  content: "\f27d";
	}
	.fa-black-tie:before {
	  content: "\f27e";
	}
	.fa-fonticons:before {
	  content: "\f280";
	}
	.fa-reddit-alien:before {
	  content: "\f281";
	}
	.fa-edge:before {
	  content: "\f282";
	}
	.fa-credit-card-alt:before {
	  content: "\f283";
	}
	.fa-codiepie:before {
	  content: "\f284";
	}
	.fa-modx:before {
	  content: "\f285";
	}
	.fa-fort-awesome:before {
	  content: "\f286";
	}
	.fa-usb:before {
	  content: "\f287";
	}
	.fa-product-hunt:before {
	  content: "\f288";
	}
	.fa-mixcloud:before {
	  content: "\f289";
	}
	.fa-scribd:before {
	  content: "\f28a";
	}
	.fa-pause-circle:before {
	  content: "\f28b";
	}
	.fa-pause-circle-o:before {
	  content: "\f28c";
	}
	.fa-stop-circle:before {
	  content: "\f28d";
	}
	.fa-stop-circle-o:before {
	  content: "\f28e";
	}
	.fa-shopping-bag:before {
	  content: "\f290";
	}
	.fa-shopping-basket:before {
	  content: "\f291";
	}
	.fa-hashtag:before {
	  content: "\f292";
	}
	.fa-bluetooth:before {
	  content: "\f293";
	}
	.fa-bluetooth-b:before {
	  content: "\f294";
	}
	.fa-percent:before {
	  content: "\f295";
	}
	.fa-gitlab:before {
	  content: "\f296";
	}
	.fa-wpbeginner:before {
	  content: "\f297";
	}
	.fa-wpforms:before {
	  content: "\f298";
	}
	.fa-envira:before {
	  content: "\f299";
	}
	.fa-universal-access:before {
	  content: "\f29a";
	}
	.fa-wheelchair-alt:before {
	  content: "\f29b";
	}
	.fa-question-circle-o:before {
	  content: "\f29c";
	}
	.fa-blind:before {
	  content: "\f29d";
	}
	.fa-audio-description:before {
	  content: "\f29e";
	}
	.fa-volume-control-phone:before {
	  content: "\f2a0";
	}
	.fa-braille:before {
	  content: "\f2a1";
	}
	.fa-assistive-listening-systems:before {
	  content: "\f2a2";
	}
	.fa-asl-interpreting:before,
	.fa-american-sign-language-interpreting:before {
	  content: "\f2a3";
	}
	.fa-deafness:before,
	.fa-hard-of-hearing:before,
	.fa-deaf:before {
	  content: "\f2a4";
	}
	.fa-glide:before {
	  content: "\f2a5";
	}
	.fa-glide-g:before {
	  content: "\f2a6";
	}
	.fa-signing:before,
	.fa-sign-language:before {
	  content: "\f2a7";
	}
	.fa-low-vision:before {
	  content: "\f2a8";
	}
	.fa-viadeo:before {
	  content: "\f2a9";
	}
	.fa-viadeo-square:before {
	  content: "\f2aa";
	}
	.fa-snapchat:before {
	  content: "\f2ab";
	}
	.fa-snapchat-ghost:before {
	  content: "\f2ac";
	}
	.fa-snapchat-square:before {
	  content: "\f2ad";
	}
	.fa-pied-piper:before {
	  content: "\f2ae";
	}
	.fa-first-order:before {
	  content: "\f2b0";
	}
	.fa-yoast:before {
	  content: "\f2b1";
	}
	.fa-themeisle:before {
	  content: "\f2b2";
	}
	.fa-google-plus-circle:before,
	.fa-google-plus-official:before {
	  content: "\f2b3";
	}
	.fa-fa:before,
	.fa-font-awesome:before {
	  content: "\f2b4";
	}
	.fa-handshake-o:before {
	  content: "\f2b5";
	}
	.fa-envelope-open:before {
	  content: "\f2b6";
	}
	.fa-envelope-open-o:before {
	  content: "\f2b7";
	}
	.fa-linode:before {
	  content: "\f2b8";
	}
	.fa-address-book:before {
	  content: "\f2b9";
	}
	.fa-address-book-o:before {
	  content: "\f2ba";
	}
	.fa-vcard:before,
	.fa-address-card:before {
	  content: "\f2bb";
	}
	.fa-vcard-o:before,
	.fa-address-card-o:before {
	  content: "\f2bc";
	}
	.fa-user-circle:before {
	  content: "\f2bd";
	}
	.fa-user-circle-o:before {
	  content: "\f2be";
	}
	.fa-user-o:before {
	  content: "\f2c0";
	}
	.fa-id-badge:before {
	  content: "\f2c1";
	}
	.fa-drivers-license:before,
	.fa-id-card:before {
	  content: "\f2c2";
	}
	.fa-drivers-license-o:before,
	.fa-id-card-o:before {
	  content: "\f2c3";
	}
	.fa-quora:before {
	  content: "\f2c4";
	}
	.fa-free-code-camp:before {
	  content: "\f2c5";
	}
	.fa-telegram:before {
	  content: "\f2c6";
	}
	.fa-thermometer-4:before,
	.fa-thermometer:before,
	.fa-thermometer-full:before {
	  content: "\f2c7";
	}
	.fa-thermometer-3:before,
	.fa-thermometer-three-quarters:before {
	  content: "\f2c8";
	}
	.fa-thermometer-2:before,
	.fa-thermometer-half:before {
	  content: "\f2c9";
	}
	.fa-thermometer-1:before,
	.fa-thermometer-quarter:before {
	  content: "\f2ca";
	}
	.fa-thermometer-0:before,
	.fa-thermometer-empty:before {
	  content: "\f2cb";
	}
	.fa-shower:before {
	  content: "\f2cc";
	}
	.fa-bathtub:before,
	.fa-s15:before,
	.fa-bath:before {
	  content: "\f2cd";
	}
	.fa-podcast:before {
	  content: "\f2ce";
	}
	.fa-window-maximize:before {
	  content: "\f2d0";
	}
	.fa-window-minimize:before {
	  content: "\f2d1";
	}
	.fa-window-restore:before {
	  content: "\f2d2";
	}
	.fa-times-rectangle:before,
	.fa-window-close:before {
	  content: "\f2d3";
	}
	.fa-times-rectangle-o:before,
	.fa-window-close-o:before {
	  content: "\f2d4";
	}
	.fa-bandcamp:before {
	  content: "\f2d5";
	}
	.fa-grav:before {
	  content: "\f2d6";
	}
	.fa-etsy:before {
	  content: "\f2d7";
	}
	.fa-imdb:before {
	  content: "\f2d8";
	}
	.fa-ravelry:before {
	  content: "\f2d9";
	}
	.fa-eercast:before {
	  content: "\f2da";
	}
	.fa-microchip:before {
	  content: "\f2db";
	}
	.fa-snowflake-o:before {
	  content: "\f2dc";
	}
	.fa-superpowers:before {
	  content: "\f2dd";
	}
	.fa-wpexplorer:before {
	  content: "\f2de";
	}
	.fa-meetup:before {
	  content: "\f2e0";
	}
	.sr-only {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}
	.sr-only-focusable:active,
	.sr-only-focusable:focus {
	  position: static;
	  width: auto;
	  height: auto;
	  margin: 0;
	  overflow: visible;
	  clip: auto;
	}
	.sr-only-focusable:active,
	.sr-only-focusable:focus {
	  position: static;
	  width: auto;
	  height: auto;
	  margin: 0;
	  overflow: visible;
	  clip: auto;
	}
	/*!
	*
	* IPython base
	*
	*/
	.modal.fade .modal-dialog {
	  -webkit-transform: translate(0, 0);
	  -ms-transform: translate(0, 0);
	  -o-transform: translate(0, 0);
	  transform: translate(0, 0);
	}
	code {
	  color: #000;
	}
	pre {
	  font-size: inherit;
	  line-height: inherit;
	}
	label {
	  font-weight: normal;
	}
	/* Make the page background atleast 100% the height of the view port */
	/* Make the page itself atleast 70% the height of the view port */
	.border-box-sizing {
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	}
	.corner-all {
	  border-radius: 2px;
	}
	.no-padding {
	  padding: 0px;
	}
	/* Flexible box model classes */
	/* Taken from Alex Russell http://infrequently.org/2009/08/css-3-progress/ */
	/* This file is a compatability layer.  It allows the usage of flexible box 
	model layouts accross multiple browsers, including older browsers.  The newest,
	universal implementation of the flexible box model is used when available (see
	`Modern browsers` comments below).  Browsers that are known to implement this 
	new spec completely include:
	
	    Firefox 28.0+
	    Chrome 29.0+
	    Internet Explorer 11+ 
	    Opera 17.0+
	
	Browsers not listed, including Safari, are supported via the styling under the
	`Old browsers` comments below.
	*/
	.hbox {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	}
	.hbox > * {
	  /* Old browsers */
	  -webkit-box-flex: 0;
	  -moz-box-flex: 0;
	  box-flex: 0;
	  /* Modern browsers */
	  flex: none;
	}
	.vbox {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	}
	.vbox > * {
	  /* Old browsers */
	  -webkit-box-flex: 0;
	  -moz-box-flex: 0;
	  box-flex: 0;
	  /* Modern browsers */
	  flex: none;
	}
	.hbox.reverse,
	.vbox.reverse,
	.reverse {
	  /* Old browsers */
	  -webkit-box-direction: reverse;
	  -moz-box-direction: reverse;
	  box-direction: reverse;
	  /* Modern browsers */
	  flex-direction: row-reverse;
	}
	.hbox.box-flex0,
	.vbox.box-flex0,
	.box-flex0 {
	  /* Old browsers */
	  -webkit-box-flex: 0;
	  -moz-box-flex: 0;
	  box-flex: 0;
	  /* Modern browsers */
	  flex: none;
	  width: auto;
	}
	.hbox.box-flex1,
	.vbox.box-flex1,
	.box-flex1 {
	  /* Old browsers */
	  -webkit-box-flex: 1;
	  -moz-box-flex: 1;
	  box-flex: 1;
	  /* Modern browsers */
	  flex: 1;
	}
	.hbox.box-flex,
	.vbox.box-flex,
	.box-flex {
	  /* Old browsers */
	  /* Old browsers */
	  -webkit-box-flex: 1;
	  -moz-box-flex: 1;
	  box-flex: 1;
	  /* Modern browsers */
	  flex: 1;
	}
	.hbox.box-flex2,
	.vbox.box-flex2,
	.box-flex2 {
	  /* Old browsers */
	  -webkit-box-flex: 2;
	  -moz-box-flex: 2;
	  box-flex: 2;
	  /* Modern browsers */
	  flex: 2;
	}
	.box-group1 {
	  /*  Deprecated */
	  -webkit-box-flex-group: 1;
	  -moz-box-flex-group: 1;
	  box-flex-group: 1;
	}
	.box-group2 {
	  /* Deprecated */
	  -webkit-box-flex-group: 2;
	  -moz-box-flex-group: 2;
	  box-flex-group: 2;
	}
	.hbox.start,
	.vbox.start,
	.start {
	  /* Old browsers */
	  -webkit-box-pack: start;
	  -moz-box-pack: start;
	  box-pack: start;
	  /* Modern browsers */
	  justify-content: flex-start;
	}
	.hbox.end,
	.vbox.end,
	.end {
	  /* Old browsers */
	  -webkit-box-pack: end;
	  -moz-box-pack: end;
	  box-pack: end;
	  /* Modern browsers */
	  justify-content: flex-end;
	}
	.hbox.center,
	.vbox.center,
	.center {
	  /* Old browsers */
	  -webkit-box-pack: center;
	  -moz-box-pack: center;
	  box-pack: center;
	  /* Modern browsers */
	  justify-content: center;
	}
	.hbox.baseline,
	.vbox.baseline,
	.baseline {
	  /* Old browsers */
	  -webkit-box-pack: baseline;
	  -moz-box-pack: baseline;
	  box-pack: baseline;
	  /* Modern browsers */
	  justify-content: baseline;
	}
	.hbox.stretch,
	.vbox.stretch,
	.stretch {
	  /* Old browsers */
	  -webkit-box-pack: stretch;
	  -moz-box-pack: stretch;
	  box-pack: stretch;
	  /* Modern browsers */
	  justify-content: stretch;
	}
	.hbox.align-start,
	.vbox.align-start,
	.align-start {
	  /* Old browsers */
	  -webkit-box-align: start;
	  -moz-box-align: start;
	  box-align: start;
	  /* Modern browsers */
	  align-items: flex-start;
	}
	.hbox.align-end,
	.vbox.align-end,
	.align-end {
	  /* Old browsers */
	  -webkit-box-align: end;
	  -moz-box-align: end;
	  box-align: end;
	  /* Modern browsers */
	  align-items: flex-end;
	}
	.hbox.align-center,
	.vbox.align-center,
	.align-center {
	  /* Old browsers */
	  -webkit-box-align: center;
	  -moz-box-align: center;
	  box-align: center;
	  /* Modern browsers */
	  align-items: center;
	}
	.hbox.align-baseline,
	.vbox.align-baseline,
	.align-baseline {
	  /* Old browsers */
	  -webkit-box-align: baseline;
	  -moz-box-align: baseline;
	  box-align: baseline;
	  /* Modern browsers */
	  align-items: baseline;
	}
	.hbox.align-stretch,
	.vbox.align-stretch,
	.align-stretch {
	  /* Old browsers */
	  -webkit-box-align: stretch;
	  -moz-box-align: stretch;
	  box-align: stretch;
	  /* Modern browsers */
	  align-items: stretch;
	}
	div.error {
	  margin: 2em;
	  text-align: center;
	}
	div.error > h1 {
	  font-size: 500%;
	  line-height: normal;
	}
	div.error > p {
	  font-size: 200%;
	  line-height: normal;
	}
	div.traceback-wrapper {
	  text-align: left;
	  max-width: 800px;
	  margin: auto;
	}
	div.traceback-wrapper pre.traceback {
	  max-height: 600px;
	  overflow: auto;
	}
	/**
	 * Primary styles
	 *
	 * Author: Jupyter Development Team
	 */
	body {
	  background-color: #fff;
	  /* This makes sure that the body covers the entire window and needs to
	       be in a different element than the display: box in wrapper below */
	  position: absolute;
	  left: 0px;
	  right: 0px;
	  top: 0px;
	  bottom: 0px;
	  overflow: visible;
	}
	body > #header {
	  /* Initially hidden to prevent FLOUC */
	  display: none;
	  background-color: #fff;
	  /* Display over codemirror */
	  position: relative;
	  z-index: 100;
	}
	body > #header #header-container {
	  display: flex;
	  flex-direction: row;
	  justify-content: space-between;
	  padding: 5px;
	  padding-bottom: 5px;
	  padding-top: 5px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	}
	body > #header .header-bar {
	  width: 100%;
	  height: 1px;
	  background: #e7e7e7;
	  margin-bottom: -1px;
	}
	@media print {
	  body > #header {
	    display: none !important;
	  }
	}
	#header-spacer {
	  width: 100%;
	  visibility: hidden;
	}
	@media print {
	  #header-spacer {
	    display: none;
	  }
	}
	#ipython_notebook {
	  padding-left: 0px;
	  padding-top: 1px;
	  padding-bottom: 1px;
	}
	[dir="rtl"] #ipython_notebook {
	  margin-right: 10px;
	  margin-left: 0;
	}
	[dir="rtl"] #ipython_notebook.pull-left {
	  float: right !important;
	  float: right;
	}
	.flex-spacer {
	  flex: 1;
	}
	#noscript {
	  width: auto;
	  padding-top: 16px;
	  padding-bottom: 16px;
	  text-align: center;
	  font-size: 22px;
	  color: red;
	  font-weight: bold;
	}
	#ipython_notebook img {
	  height: 28px;
	}
	#site {
	  width: 100%;
	  display: none;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  overflow: auto;
	}
	@media print {
	  #site {
	    height: auto !important;
	  }
	}
	/* Smaller buttons */
	.ui-button .ui-button-text {
	  padding: 0.2em 0.8em;
	  font-size: 77%;
	}
	input.ui-button {
	  padding: 0.3em 0.9em;
	}
	span#kernel_logo_widget {
	  margin: 0 10px;
	}
	span#login_widget {
	  float: right;
	}
	[dir="rtl"] span#login_widget {
	  float: left;
	}
	span#login_widget > .button,
	#logout {
	  color: #333;
	  background-color: #fff;
	  border-color: #ccc;
	}
	span#login_widget > .button:focus,
	#logout:focus,
	span#login_widget > .button.focus,
	#logout.focus {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #8c8c8c;
	}
	span#login_widget > .button:hover,
	#logout:hover {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	span#login_widget > .button:active,
	#logout:active,
	span#login_widget > .button.active,
	#logout.active,
	.open > .dropdown-togglespan#login_widget > .button,
	.open > .dropdown-toggle#logout {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	span#login_widget > .button:active:hover,
	#logout:active:hover,
	span#login_widget > .button.active:hover,
	#logout.active:hover,
	.open > .dropdown-togglespan#login_widget > .button:hover,
	.open > .dropdown-toggle#logout:hover,
	span#login_widget > .button:active:focus,
	#logout:active:focus,
	span#login_widget > .button.active:focus,
	#logout.active:focus,
	.open > .dropdown-togglespan#login_widget > .button:focus,
	.open > .dropdown-toggle#logout:focus,
	span#login_widget > .button:active.focus,
	#logout:active.focus,
	span#login_widget > .button.active.focus,
	#logout.active.focus,
	.open > .dropdown-togglespan#login_widget > .button.focus,
	.open > .dropdown-toggle#logout.focus {
	  color: #333;
	  background-color: #d4d4d4;
	  border-color: #8c8c8c;
	}
	span#login_widget > .button:active,
	#logout:active,
	span#login_widget > .button.active,
	#logout.active,
	.open > .dropdown-togglespan#login_widget > .button,
	.open > .dropdown-toggle#logout {
	  background-image: none;
	}
	span#login_widget > .button.disabled:hover,
	#logout.disabled:hover,
	span#login_widget > .button[disabled]:hover,
	#logout[disabled]:hover,
	fieldset[disabled] span#login_widget > .button:hover,
	fieldset[disabled] #logout:hover,
	span#login_widget > .button.disabled:focus,
	#logout.disabled:focus,
	span#login_widget > .button[disabled]:focus,
	#logout[disabled]:focus,
	fieldset[disabled] span#login_widget > .button:focus,
	fieldset[disabled] #logout:focus,
	span#login_widget > .button.disabled.focus,
	#logout.disabled.focus,
	span#login_widget > .button[disabled].focus,
	#logout[disabled].focus,
	fieldset[disabled] span#login_widget > .button.focus,
	fieldset[disabled] #logout.focus {
	  background-color: #fff;
	  border-color: #ccc;
	}
	span#login_widget > .button .badge,
	#logout .badge {
	  color: #fff;
	  background-color: #333;
	}
	.nav-header {
	  text-transform: none;
	}
	#header > span {
	  margin-top: 10px;
	}
	.modal_stretch .modal-dialog {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	  min-height: 80vh;
	}
	.modal_stretch .modal-dialog .modal-body {
	  max-height: calc(100vh - 200px);
	  overflow: auto;
	  flex: 1;
	}
	.modal-header {
	  cursor: move;
	}
	@media (min-width: 768px) {
	  .modal .modal-dialog {
	    width: 700px;
	  }
	}
	@media (min-width: 768px) {
	  select.form-control {
	    margin-left: 12px;
	    margin-right: 12px;
	  }
	}
	/*!
	*
	* IPython auth
	*
	*/
	.center-nav {
	  display: inline-block;
	  margin-bottom: -4px;
	}
	[dir="rtl"] .center-nav form.pull-left {
	  float: right !important;
	  float: right;
	}
	[dir="rtl"] .center-nav .navbar-text {
	  float: right;
	}
	[dir="rtl"] .navbar-inner {
	  text-align: right;
	}
	[dir="rtl"] div.text-left {
	  text-align: right;
	}
	/*!
	*
	* IPython tree view
	*
	*/
	/* We need an invisible input field on top of the sentense*/
	/* "Drag file onto the list ..." */
	.alternate_upload {
	  background-color: none;
	  display: inline;
	}
	.alternate_upload.form {
	  padding: 0;
	  margin: 0;
	}
	.alternate_upload input.fileinput {
	  position: absolute;
	  display: block;
	  width: 100%;
	  height: 100%;
	  overflow: hidden;
	  cursor: pointer;
	  opacity: 0;
	  z-index: 2;
	}
	.alternate_upload .btn-xs > input.fileinput {
	  margin: -1px -5px;
	}
	.alternate_upload .btn-upload {
	  position: relative;
	  height: 22px;
	}
	::-webkit-file-upload-button {
	  cursor: pointer;
	}
	/**
	 * Primary styles
	 *
	 * Author: Jupyter Development Team
	 */
	ul#tabs {
	  margin-bottom: 4px;
	}
	ul#tabs a {
	  padding-top: 6px;
	  padding-bottom: 4px;
	}
	[dir="rtl"] ul#tabs.nav-tabs > li {
	  float: right;
	}
	[dir="rtl"] ul#tabs.nav.nav-tabs {
	  padding-right: 0;
	}
	ul.breadcrumb a:focus,
	ul.breadcrumb a:hover {
	  text-decoration: none;
	}
	ul.breadcrumb i.icon-home {
	  font-size: 16px;
	  margin-right: 4px;
	}
	ul.breadcrumb span {
	  color: #5e5e5e;
	}
	.list_toolbar {
	  padding: 4px 0 4px 0;
	  vertical-align: middle;
	}
	.list_toolbar .tree-buttons {
	  padding-top: 1px;
	}
	[dir="rtl"] .list_toolbar .tree-buttons .pull-right {
	  float: left !important;
	  float: left;
	}
	[dir="rtl"] .list_toolbar .col-sm-4,
	[dir="rtl"] .list_toolbar .col-sm-8 {
	  float: right;
	}
	.dynamic-buttons {
	  padding-top: 3px;
	  display: inline-block;
	}
	.list_toolbar [class*="span"] {
	  min-height: 24px;
	}
	.list_header {
	  font-weight: bold;
	  background-color: #EEE;
	}
	.list_placeholder {
	  font-weight: bold;
	  padding-top: 4px;
	  padding-bottom: 4px;
	  padding-left: 7px;
	  padding-right: 7px;
	}
	.list_container {
	  margin-top: 4px;
	  margin-bottom: 20px;
	  border: 1px solid #ddd;
	  border-radius: 2px;
	}
	.list_container > div {
	  border-bottom: 1px solid #ddd;
	}
	.list_container > div:hover .list-item {
	  background-color: red;
	}
	.list_container > div:last-child {
	  border: none;
	}
	.list_item:hover .list_item {
	  background-color: #ddd;
	}
	.list_item a {
	  text-decoration: none;
	}
	.list_item:hover {
	  background-color: #fafafa;
	}
	.list_header > div,
	.list_item > div {
	  padding-top: 4px;
	  padding-bottom: 4px;
	  padding-left: 7px;
	  padding-right: 7px;
	  line-height: 22px;
	}
	.list_header > div input,
	.list_item > div input {
	  margin-right: 7px;
	  margin-left: 14px;
	  vertical-align: text-bottom;
	  line-height: 22px;
	  position: relative;
	  top: -1px;
	}
	.list_header > div .item_link,
	.list_item > div .item_link {
	  margin-left: -1px;
	  vertical-align: baseline;
	  line-height: 22px;
	}
	[dir="rtl"] .list_item > div input {
	  margin-right: 0;
	}
	.new-file input[type=checkbox] {
	  visibility: hidden;
	}
	.item_name {
	  line-height: 22px;
	  height: 24px;
	}
	.item_icon {
	  font-size: 14px;
	  color: #5e5e5e;
	  margin-right: 7px;
	  margin-left: 7px;
	  line-height: 22px;
	  vertical-align: baseline;
	}
	.item_modified {
	  margin-right: 7px;
	  margin-left: 7px;
	}
	[dir="rtl"] .item_modified.pull-right {
	  float: left !important;
	  float: left;
	}
	.item_buttons {
	  line-height: 1em;
	  margin-left: -5px;
	}
	.item_buttons .btn,
	.item_buttons .btn-group,
	.item_buttons .input-group {
	  float: left;
	}
	.item_buttons > .btn,
	.item_buttons > .btn-group,
	.item_buttons > .input-group {
	  margin-left: 5px;
	}
	.item_buttons .btn {
	  min-width: 13ex;
	}
	.item_buttons .running-indicator {
	  padding-top: 4px;
	  color: #5cb85c;
	}
	.item_buttons .kernel-name {
	  padding-top: 4px;
	  color: #5bc0de;
	  margin-right: 7px;
	  float: left;
	}
	[dir="rtl"] .item_buttons.pull-right {
	  float: left !important;
	  float: left;
	}
	[dir="rtl"] .item_buttons .kernel-name {
	  margin-left: 7px;
	  float: right;
	}
	.toolbar_info {
	  height: 24px;
	  line-height: 24px;
	}
	.list_item input:not([type=checkbox]) {
	  padding-top: 3px;
	  padding-bottom: 3px;
	  height: 22px;
	  line-height: 14px;
	  margin: 0px;
	}
	.highlight_text {
	  color: blue;
	}
	#project_name {
	  display: inline-block;
	  padding-left: 7px;
	  margin-left: -2px;
	}
	#project_name > .breadcrumb {
	  padding: 0px;
	  margin-bottom: 0px;
	  background-color: transparent;
	  font-weight: bold;
	}
	.sort_button {
	  display: inline-block;
	  padding-left: 7px;
	}
	[dir="rtl"] .sort_button.pull-right {
	  float: left !important;
	  float: left;
	}
	#tree-selector {
	  padding-right: 0px;
	}
	#button-select-all {
	  min-width: 50px;
	}
	[dir="rtl"] #button-select-all.btn {
	  float: right ;
	}
	#select-all {
	  margin-left: 7px;
	  margin-right: 2px;
	  margin-top: 2px;
	  height: 16px;
	}
	[dir="rtl"] #select-all.pull-left {
	  float: right !important;
	  float: right;
	}
	.menu_icon {
	  margin-right: 2px;
	}
	.tab-content .row {
	  margin-left: 0px;
	  margin-right: 0px;
	}
	.folder_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f114";
	}
	.folder_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.folder_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.folder_icon:before.pull-left {
	  margin-right: .3em;
	}
	.folder_icon:before.pull-right {
	  margin-left: .3em;
	}
	.notebook_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f02d";
	  position: relative;
	  top: -1px;
	}
	.notebook_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.notebook_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.notebook_icon:before.pull-left {
	  margin-right: .3em;
	}
	.notebook_icon:before.pull-right {
	  margin-left: .3em;
	}
	.running_notebook_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f02d";
	  position: relative;
	  top: -1px;
	  color: #5cb85c;
	}
	.running_notebook_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.running_notebook_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.running_notebook_icon:before.pull-left {
	  margin-right: .3em;
	}
	.running_notebook_icon:before.pull-right {
	  margin-left: .3em;
	}
	.file_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f016";
	  position: relative;
	  top: -2px;
	}
	.file_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.file_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.file_icon:before.pull-left {
	  margin-right: .3em;
	}
	.file_icon:before.pull-right {
	  margin-left: .3em;
	}
	#notebook_toolbar .pull-right {
	  padding-top: 0px;
	  margin-right: -1px;
	}
	ul#new-menu {
	  left: auto;
	  right: 0;
	}
	#new-menu .dropdown-header {
	  font-size: 10px;
	  border-bottom: 1px solid #e5e5e5;
	  padding: 0 0 3px;
	  margin: -3px 20px 0;
	}
	.kernel-menu-icon {
	  padding-right: 12px;
	  width: 24px;
	  content: "\f096";
	}
	.kernel-menu-icon:before {
	  content: "\f096";
	}
	.kernel-menu-icon-current:before {
	  content: "\f00c";
	}
	#tab_content {
	  padding-top: 20px;
	}
	#running .panel-group .panel {
	  margin-top: 3px;
	  margin-bottom: 1em;
	}
	#running .panel-group .panel .panel-heading {
	  background-color: #EEE;
	  padding-top: 4px;
	  padding-bottom: 4px;
	  padding-left: 7px;
	  padding-right: 7px;
	  line-height: 22px;
	}
	#running .panel-group .panel .panel-heading a:focus,
	#running .panel-group .panel .panel-heading a:hover {
	  text-decoration: none;
	}
	#running .panel-group .panel .panel-body {
	  padding: 0px;
	}
	#running .panel-group .panel .panel-body .list_container {
	  margin-top: 0px;
	  margin-bottom: 0px;
	  border: 0px;
	  border-radius: 0px;
	}
	#running .panel-group .panel .panel-body .list_container .list_item {
	  border-bottom: 1px solid #ddd;
	}
	#running .panel-group .panel .panel-body .list_container .list_item:last-child {
	  border-bottom: 0px;
	}
	.delete-button {
	  display: none;
	}
	.duplicate-button {
	  display: none;
	}
	.rename-button {
	  display: none;
	}
	.move-button {
	  display: none;
	}
	.download-button {
	  display: none;
	}
	.shutdown-button {
	  display: none;
	}
	.dynamic-instructions {
	  display: inline-block;
	  padding-top: 4px;
	}
	/*!
	*
	* IPython text editor webapp
	*
	*/
	.selected-keymap i.fa {
	  padding: 0px 5px;
	}
	.selected-keymap i.fa:before {
	  content: "\f00c";
	}
	#mode-menu {
	  overflow: auto;
	  max-height: 20em;
	}
	.edit_app #header {
	  -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	}
	.edit_app #menubar .navbar {
	  /* Use a negative 1 bottom margin, so the border overlaps the border of the
	    header */
	  margin-bottom: -1px;
	}
	.dirty-indicator {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  width: 20px;
	}
	.dirty-indicator.fa-pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator.fa-pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator.pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator.pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-dirty {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  width: 20px;
	}
	.dirty-indicator-dirty.fa-pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-dirty.fa-pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-dirty.pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-dirty.pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-clean {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  width: 20px;
	}
	.dirty-indicator-clean.fa-pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-clean.fa-pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-clean.pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-clean.pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-clean:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f00c";
	}
	.dirty-indicator-clean:before.fa-pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-clean:before.fa-pull-right {
	  margin-left: .3em;
	}
	.dirty-indicator-clean:before.pull-left {
	  margin-right: .3em;
	}
	.dirty-indicator-clean:before.pull-right {
	  margin-left: .3em;
	}
	#filename {
	  font-size: 16pt;
	  display: table;
	  padding: 0px 5px;
	}
	#current-mode {
	  padding-left: 5px;
	  padding-right: 5px;
	}
	#texteditor-backdrop {
	  padding-top: 20px;
	  padding-bottom: 20px;
	}
	@media not print {
	  #texteditor-backdrop {
	    background-color: #EEE;
	  }
	}
	@media print {
	  #texteditor-backdrop #texteditor-container .CodeMirror-gutter,
	  #texteditor-backdrop #texteditor-container .CodeMirror-gutters {
	    background-color: #fff;
	  }
	}
	@media not print {
	  #texteditor-backdrop #texteditor-container .CodeMirror-gutter,
	  #texteditor-backdrop #texteditor-container .CodeMirror-gutters {
	    background-color: #fff;
	  }
	}
	@media not print {
	  #texteditor-backdrop #texteditor-container {
	    padding: 0px;
	    background-color: #fff;
	    -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	    box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  }
	}
	.CodeMirror-dialog {
	  background-color: #fff;
	}
	/*!
	*
	* IPython notebook
	*
	*/
	/* CSS font colors for translated ANSI escape sequences */
	/* The color values are a mix of
	   http://www.xcolors.net/dl/baskerville-ivorylight and
	   http://www.xcolors.net/dl/euphrasia */
	.ansi-black-fg {
	  color: #3E424D;
	}
	.ansi-black-bg {
	  background-color: #3E424D;
	}
	.ansi-black-intense-fg {
	  color: #282C36;
	}
	.ansi-black-intense-bg {
	  background-color: #282C36;
	}
	.ansi-red-fg {
	  color: #E75C58;
	}
	.ansi-red-bg {
	  background-color: #E75C58;
	}
	.ansi-red-intense-fg {
	  color: #B22B31;
	}
	.ansi-red-intense-bg {
	  background-color: #B22B31;
	}
	.ansi-green-fg {
	  color: #00A250;
	}
	.ansi-green-bg {
	  background-color: #00A250;
	}
	.ansi-green-intense-fg {
	  color: #007427;
	}
	.ansi-green-intense-bg {
	  background-color: #007427;
	}
	.ansi-yellow-fg {
	  color: #DDB62B;
	}
	.ansi-yellow-bg {
	  background-color: #DDB62B;
	}
	.ansi-yellow-intense-fg {
	  color: #B27D12;
	}
	.ansi-yellow-intense-bg {
	  background-color: #B27D12;
	}
	.ansi-blue-fg {
	  color: #208FFB;
	}
	.ansi-blue-bg {
	  background-color: #208FFB;
	}
	.ansi-blue-intense-fg {
	  color: #0065CA;
	}
	.ansi-blue-intense-bg {
	  background-color: #0065CA;
	}
	.ansi-magenta-fg {
	  color: #D160C4;
	}
	.ansi-magenta-bg {
	  background-color: #D160C4;
	}
	.ansi-magenta-intense-fg {
	  color: #A03196;
	}
	.ansi-magenta-intense-bg {
	  background-color: #A03196;
	}
	.ansi-cyan-fg {
	  color: #60C6C8;
	}
	.ansi-cyan-bg {
	  background-color: #60C6C8;
	}
	.ansi-cyan-intense-fg {
	  color: #258F8F;
	}
	.ansi-cyan-intense-bg {
	  background-color: #258F8F;
	}
	.ansi-white-fg {
	  color: #C5C1B4;
	}
	.ansi-white-bg {
	  background-color: #C5C1B4;
	}
	.ansi-white-intense-fg {
	  color: #A1A6B2;
	}
	.ansi-white-intense-bg {
	  background-color: #A1A6B2;
	}
	.ansi-default-inverse-fg {
	  color: #FFFFFF;
	}
	.ansi-default-inverse-bg {
	  background-color: #000000;
	}
	.ansi-bold {
	  font-weight: bold;
	}
	.ansi-underline {
	  text-decoration: underline;
	}
	/* The following styles are deprecated an will be removed in a future version */
	.ansibold {
	  font-weight: bold;
	}
	.ansi-inverse {
	  outline: 0.5px dotted;
	}
	/* use dark versions for foreground, to improve visibility */
	.ansiblack {
	  color: black;
	}
	.ansired {
	  color: darkred;
	}
	.ansigreen {
	  color: darkgreen;
	}
	.ansiyellow {
	  color: #c4a000;
	}
	.ansiblue {
	  color: darkblue;
	}
	.ansipurple {
	  color: darkviolet;
	}
	.ansicyan {
	  color: steelblue;
	}
	.ansigray {
	  color: gray;
	}
	/* and light for background, for the same reason */
	.ansibgblack {
	  background-color: black;
	}
	.ansibgred {
	  background-color: red;
	}
	.ansibggreen {
	  background-color: green;
	}
	.ansibgyellow {
	  background-color: yellow;
	}
	.ansibgblue {
	  background-color: blue;
	}
	.ansibgpurple {
	  background-color: magenta;
	}
	.ansibgcyan {
	  background-color: cyan;
	}
	.ansibggray {
	  background-color: gray;
	}
	div.cell {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	  border-radius: 2px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  border-width: 1px;
	  border-style: solid;
	  border-color: transparent;
	  width: 100%;
	  padding: 5px;
	  /* This acts as a spacer between cells, that is outside the border */
	  margin: 0px;
	  outline: none;
	  position: relative;
	  overflow: visible;
	}
	div.cell:before {
	  position: absolute;
	  display: block;
	  top: -1px;
	  left: -1px;
	  width: 5px;
	  height: calc(100% +  2px);
	  content: '';
	  background: transparent;
	}
	div.cell.jupyter-soft-selected {
	  border-left-color: #E3F2FD;
	  border-left-width: 1px;
	  padding-left: 5px;
	  border-right-color: #E3F2FD;
	  border-right-width: 1px;
	  background: #E3F2FD;
	}
	@media print {
	  div.cell.jupyter-soft-selected {
	    border-color: transparent;
	  }
	}
	div.cell.selected,
	div.cell.selected.jupyter-soft-selected {
	  border-color: #ababab;
	}
	div.cell.selected:before,
	div.cell.selected.jupyter-soft-selected:before {
	  position: absolute;
	  display: block;
	  top: -1px;
	  left: -1px;
	  width: 5px;
	  height: calc(100% +  2px);
	  content: '';
	  background: #42A5F5;
	}
	@media print {
	  div.cell.selected,
	  div.cell.selected.jupyter-soft-selected {
	    border-color: transparent;
	  }
	}
	.edit_mode div.cell.selected {
	  border-color: #66BB6A;
	}
	.edit_mode div.cell.selected:before {
	  position: absolute;
	  display: block;
	  top: -1px;
	  left: -1px;
	  width: 5px;
	  height: calc(100% +  2px);
	  content: '';
	  background: #66BB6A;
	}
	@media print {
	  .edit_mode div.cell.selected {
	    border-color: transparent;
	  }
	}
	.prompt {
	  /* This needs to be wide enough for 3 digit prompt numbers: In[100]: */
	  min-width: 14ex;
	  /* This padding is tuned to match the padding on the CodeMirror editor. */
	  padding: 0.4em;
	  margin: 0px;
	  font-family: monospace;
	  text-align: right;
	  /* This has to match that of the the CodeMirror class line-height below */
	  line-height: 1.21429em;
	  /* Don't highlight prompt number selection */
	  -webkit-touch-callout: none;
	  -webkit-user-select: none;
	  -khtml-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	  /* Use default cursor */
	  cursor: default;
	}
	@media (max-width: 540px) {
	  .prompt {
	    text-align: left;
	  }
	}
	div.inner_cell {
	  min-width: 0;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	  /* Old browsers */
	  -webkit-box-flex: 1;
	  -moz-box-flex: 1;
	  box-flex: 1;
	  /* Modern browsers */
	  flex: 1;
	}
	/* input_area and input_prompt must match in top border and margin for alignment */
	div.input_area {
	  border: 1px solid #cfcfcf;
	  border-radius: 2px;
	  background: #f7f7f7;
	  line-height: 1.21429em;
	}
	/* This is needed so that empty prompt areas can collapse to zero height when there
	   is no content in the output_subarea and the prompt. The main purpose of this is
	   to make sure that empty JavaScript output_subareas have no height. */
	div.prompt:empty {
	  padding-top: 0;
	  padding-bottom: 0;
	}
	div.unrecognized_cell {
	  padding: 5px 5px 5px 0px;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	}
	div.unrecognized_cell .inner_cell {
	  border-radius: 2px;
	  padding: 5px;
	  font-weight: bold;
	  color: red;
	  border: 1px solid #cfcfcf;
	  background: #eaeaea;
	}
	div.unrecognized_cell .inner_cell a {
	  color: inherit;
	  text-decoration: none;
	}
	div.unrecognized_cell .inner_cell a:hover {
	  color: inherit;
	  text-decoration: none;
	}
	@media (max-width: 540px) {
	  div.unrecognized_cell > div.prompt {
	    display: none;
	  }
	}
	div.code_cell {
	  /* avoid page breaking on code cells when printing */
	}
	@media print {
	  div.code_cell {
	    page-break-inside: avoid;
	  }
	}
	/* any special styling for code cells that are currently running goes here */
	div.input {
	  page-break-inside: avoid;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	}
	@media (max-width: 540px) {
	  div.input {
	    /* Old browsers */
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-box-align: stretch;
	    display: -moz-box;
	    -moz-box-orient: vertical;
	    -moz-box-align: stretch;
	    display: box;
	    box-orient: vertical;
	    box-align: stretch;
	    /* Modern browsers */
	    display: flex;
	    flex-direction: column;
	    align-items: stretch;
	  }
	}
	/* input_area and input_prompt must match in top border and margin for alignment */
	div.input_prompt {
	  color: #303F9F;
	  border-top: 1px solid transparent;
	}
	div.input_area > div.highlight {
	  margin: 0.4em;
	  border: none;
	  padding: 0px;
	  background-color: transparent;
	}
	div.input_area > div.highlight > pre {
	  margin: 0px;
	  border: none;
	  padding: 0px;
	  background-color: transparent;
	}
	/* The following gets added to the <head> if it is detected that the user has a
	 * monospace font with inconsistent normal/bold/italic height.  See
	 * notebookmain.js.  Such fonts will have keywords vertically offset with
	 * respect to the rest of the text.  The user should select a better font.
	 * See: https://github.com/ipython/ipython/issues/1503
	 *
	 * .CodeMirror span {
	 *      vertical-align: bottom;
	 * }
	 */
	.CodeMirror {
	  line-height: 1.21429em;
	  /* Changed from 1em to our global default */
	  font-size: 14px;
	  height: auto;
	  /* Changed to auto to autogrow */
	  background: none;
	  /* Changed from white to allow our bg to show through */
	}
	.CodeMirror-scroll {
	  /*  The CodeMirror docs are a bit fuzzy on if overflow-y should be hidden or visible.*/
	  /*  We have found that if it is visible, vertical scrollbars appear with font size changes.*/
	  overflow-y: hidden;
	  overflow-x: auto;
	}
	.CodeMirror-lines {
	  /* In CM2, this used to be 0.4em, but in CM3 it went to 4px. We need the em value because */
	  /* we have set a different line-height and want this to scale with that. */
	  /* Note that this should set vertical padding only, since CodeMirror assumes
	       that horizontal padding will be set on CodeMirror pre */
	  padding: 0.4em 0;
	}
	.CodeMirror-linenumber {
	  padding: 0 8px 0 4px;
	}
	.CodeMirror-gutters {
	  border-bottom-left-radius: 2px;
	  border-top-left-radius: 2px;
	}
	.CodeMirror pre {
	  /* In CM3 this went to 4px from 0 in CM2. This sets horizontal padding only,
	    use .CodeMirror-lines for vertical */
	  padding: 0 0.4em;
	  border: 0;
	  border-radius: 0;
	}
	.CodeMirror-cursor {
	  border-left: 1.4px solid black;
	}
	@media screen and (min-width: 2138px) and (max-width: 4319px) {
	  .CodeMirror-cursor {
	    border-left: 2px solid black;
	  }
	}
	@media screen and (min-width: 4320px) {
	  .CodeMirror-cursor {
	    border-left: 4px solid black;
	  }
	}
	/*
	
	Original style from softwaremaniacs.org (c) Ivan Sagalaev <Maniac@SoftwareManiacs.Org>
	Adapted from GitHub theme
	
	*/
	.highlight-base {
	  color: #000;
	}
	.highlight-variable {
	  color: #000;
	}
	.highlight-variable-2 {
	  color: #1a1a1a;
	}
	.highlight-variable-3 {
	  color: #333333;
	}
	.highlight-string {
	  color: #BA2121;
	}
	.highlight-comment {
	  color: #408080;
	  font-style: italic;
	}
	.highlight-number {
	  color: #080;
	}
	.highlight-atom {
	  color: #88F;
	}
	.highlight-keyword {
	  color: #008000;
	  font-weight: bold;
	}
	.highlight-builtin {
	  color: #008000;
	}
	.highlight-error {
	  color: #f00;
	}
	.highlight-operator {
	  color: #AA22FF;
	  font-weight: bold;
	}
	.highlight-meta {
	  color: #AA22FF;
	}
	/* previously not defined, copying from default codemirror */
	.highlight-def {
	  color: #00f;
	}
	.highlight-string-2 {
	  color: #f50;
	}
	.highlight-qualifier {
	  color: #555;
	}
	.highlight-bracket {
	  color: #997;
	}
	.highlight-tag {
	  color: #170;
	}
	.highlight-attribute {
	  color: #00c;
	}
	.highlight-header {
	  color: blue;
	}
	.highlight-quote {
	  color: #090;
	}
	.highlight-link {
	  color: #00c;
	}
	/* apply the same style to codemirror */
	.cm-s-ipython span.cm-keyword {
	  color: #008000;
	  font-weight: bold;
	}
	.cm-s-ipython span.cm-atom {
	  color: #88F;
	}
	.cm-s-ipython span.cm-number {
	  color: #080;
	}
	.cm-s-ipython span.cm-def {
	  color: #00f;
	}
	.cm-s-ipython span.cm-variable {
	  color: #000;
	}
	.cm-s-ipython span.cm-operator {
	  color: #AA22FF;
	  font-weight: bold;
	}
	.cm-s-ipython span.cm-variable-2 {
	  color: #1a1a1a;
	}
	.cm-s-ipython span.cm-variable-3 {
	  color: #333333;
	}
	.cm-s-ipython span.cm-comment {
	  color: #408080;
	  font-style: italic;
	}
	.cm-s-ipython span.cm-string {
	  color: #BA2121;
	}
	.cm-s-ipython span.cm-string-2 {
	  color: #f50;
	}
	.cm-s-ipython span.cm-meta {
	  color: #AA22FF;
	}
	.cm-s-ipython span.cm-qualifier {
	  color: #555;
	}
	.cm-s-ipython span.cm-builtin {
	  color: #008000;
	}
	.cm-s-ipython span.cm-bracket {
	  color: #997;
	}
	.cm-s-ipython span.cm-tag {
	  color: #170;
	}
	.cm-s-ipython span.cm-attribute {
	  color: #00c;
	}
	.cm-s-ipython span.cm-header {
	  color: blue;
	}
	.cm-s-ipython span.cm-quote {
	  color: #090;
	}
	.cm-s-ipython span.cm-link {
	  color: #00c;
	}
	.cm-s-ipython span.cm-error {
	  color: #f00;
	}
	.cm-s-ipython span.cm-tab {
	  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
	  background-position: right;
	  background-repeat: no-repeat;
	}
	div.output_wrapper {
	  /* this position must be relative to enable descendents to be absolute within it */
	  position: relative;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	  z-index: 1;
	}
	/* class for the output area when it should be height-limited */
	div.output_scroll {
	  /* ideally, this would be max-height, but FF barfs all over that */
	  height: 24em;
	  /* FF needs this *and the wrapper* to specify full width, or it will shrinkwrap */
	  width: 100%;
	  overflow: auto;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.8);
	  box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.8);
	  display: block;
	}
	/* output div while it is collapsed */
	div.output_collapsed {
	  margin: 0px;
	  padding: 0px;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	}
	div.out_prompt_overlay {
	  height: 100%;
	  padding: 0px 0.4em;
	  position: absolute;
	  border-radius: 2px;
	}
	div.out_prompt_overlay:hover {
	  /* use inner shadow to get border that is computed the same on WebKit/FF */
	  -webkit-box-shadow: inset 0 0 1px #000;
	  box-shadow: inset 0 0 1px #000;
	  background: rgba(240, 240, 240, 0.5);
	}
	div.output_prompt {
	  color: #D84315;
	}
	/* This class is the outer container of all output sections. */
	div.output_area {
	  padding: 0px;
	  page-break-inside: avoid;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	}
	div.output_area .MathJax_Display {
	  text-align: left !important;
	}
	div.output_area .rendered_html table {
	  margin-left: 0;
	  margin-right: 0;
	}
	div.output_area .rendered_html img {
	  margin-left: 0;
	  margin-right: 0;
	}
	div.output_area img,
	div.output_area svg {
	  max-width: 100%;
	  height: auto;
	}
	div.output_area img.unconfined,
	div.output_area svg.unconfined {
	  max-width: none;
	}
	div.output_area .mglyph > img {
	  max-width: none;
	}
	/* This is needed to protect the pre formating from global settings such
	   as that of bootstrap */
	.output {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: vertical;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: vertical;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: column;
	  align-items: stretch;
	}
	@media (max-width: 540px) {
	  div.output_area {
	    /* Old browsers */
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-box-align: stretch;
	    display: -moz-box;
	    -moz-box-orient: vertical;
	    -moz-box-align: stretch;
	    display: box;
	    box-orient: vertical;
	    box-align: stretch;
	    /* Modern browsers */
	    display: flex;
	    flex-direction: column;
	    align-items: stretch;
	  }
	}
	div.output_area pre {
	  margin: 0;
	  padding: 1px 0 1px 0;
	  border: 0;
	  vertical-align: baseline;
	  color: black;
	  background-color: transparent;
	  border-radius: 0;
	}
	/* This class is for the output subarea inside the output_area and after
	   the prompt div. */
	div.output_subarea {
	  overflow-x: auto;
	  padding: 0.4em;
	  /* Old browsers */
	  -webkit-box-flex: 1;
	  -moz-box-flex: 1;
	  box-flex: 1;
	  /* Modern browsers */
	  flex: 1;
	  max-width: calc(100% - 14ex);
	}
	div.output_scroll div.output_subarea {
	  overflow-x: visible;
	}
	/* The rest of the output_* classes are for special styling of the different
	   output types */
	/* all text output has this class: */
	div.output_text {
	  text-align: left;
	  color: #000;
	  /* This has to match that of the the CodeMirror class line-height below */
	  line-height: 1.21429em;
	}
	/* stdout/stderr are 'text' as well as 'stream', but execute_result/error are *not* streams */
	div.output_stderr {
	  background: #fdd;
	  /* very light red background for stderr */
	}
	div.output_latex {
	  text-align: left;
	}
	/* Empty output_javascript divs should have no height */
	div.output_javascript:empty {
	  padding: 0;
	}
	.js-error {
	  color: darkred;
	}
	/* raw_input styles */
	div.raw_input_container {
	  line-height: 1.21429em;
	  padding-top: 5px;
	}
	pre.raw_input_prompt {
	  /* nothing needed here. */
	}
	input.raw_input {
	  font-family: monospace;
	  font-size: inherit;
	  color: inherit;
	  width: auto;
	  /* make sure input baseline aligns with prompt */
	  vertical-align: baseline;
	  /* padding + margin = 0.5em between prompt and cursor */
	  padding: 0em 0.25em;
	  margin: 0em 0.25em;
	}
	input.raw_input:focus {
	  box-shadow: none;
	}
	p.p-space {
	  margin-bottom: 10px;
	}
	div.output_unrecognized {
	  padding: 5px;
	  font-weight: bold;
	  color: red;
	}
	div.output_unrecognized a {
	  color: inherit;
	  text-decoration: none;
	}
	div.output_unrecognized a:hover {
	  color: inherit;
	  text-decoration: none;
	}
	.rendered_html {
	  color: #000;
	  /* any extras will just be numbers: */
	}
	.rendered_html em {
	  font-style: italic;
	}
	.rendered_html strong {
	  font-weight: bold;
	}
	.rendered_html u {
	  text-decoration: underline;
	}
	.rendered_html :link {
	  text-decoration: underline;
	}
	.rendered_html :visited {
	  text-decoration: underline;
	}
	.rendered_html h1 {
	  font-size: 185.7%;
	  margin: 1.08em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	}
	.rendered_html h2 {
	  font-size: 157.1%;
	  margin: 1.27em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	}
	.rendered_html h3 {
	  font-size: 128.6%;
	  margin: 1.55em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	}
	.rendered_html h4 {
	  font-size: 100%;
	  margin: 2em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	}
	.rendered_html h5 {
	  font-size: 100%;
	  margin: 2em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	  font-style: italic;
	}
	.rendered_html h6 {
	  font-size: 100%;
	  margin: 2em 0 0 0;
	  font-weight: bold;
	  line-height: 1.0;
	  font-style: italic;
	}
	.rendered_html h1:first-child {
	  margin-top: 0.538em;
	}
	.rendered_html h2:first-child {
	  margin-top: 0.636em;
	}
	.rendered_html h3:first-child {
	  margin-top: 0.777em;
	}
	.rendered_html h4:first-child {
	  margin-top: 1em;
	}
	.rendered_html h5:first-child {
	  margin-top: 1em;
	}
	.rendered_html h6:first-child {
	  margin-top: 1em;
	}
	.rendered_html ul:not(.list-inline),
	.rendered_html ol:not(.list-inline) {
	  padding-left: 2em;
	}
	.rendered_html ul {
	  list-style: disc;
	}
	.rendered_html ul ul {
	  list-style: square;
	  margin-top: 0;
	}
	.rendered_html ul ul ul {
	  list-style: circle;
	}
	.rendered_html ol {
	  list-style: decimal;
	}
	.rendered_html ol ol {
	  list-style: upper-alpha;
	  margin-top: 0;
	}
	.rendered_html ol ol ol {
	  list-style: lower-alpha;
	}
	.rendered_html ol ol ol ol {
	  list-style: lower-roman;
	}
	.rendered_html ol ol ol ol ol {
	  list-style: decimal;
	}
	.rendered_html * + ul {
	  margin-top: 1em;
	}
	.rendered_html * + ol {
	  margin-top: 1em;
	}
	.rendered_html hr {
	  color: black;
	  background-color: black;
	}
	.rendered_html pre {
	  margin: 1em 2em;
	  padding: 0px;
	  background-color: #fff;
	}
	.rendered_html code {
	  background-color: #eff0f1;
	}
	.rendered_html p code {
	  padding: 1px 5px;
	}
	.rendered_html pre code {
	  background-color: #fff;
	}
	.rendered_html pre,
	.rendered_html code {
	  border: 0;
	  color: #000;
	  font-size: 100%;
	}
	.rendered_html blockquote {
	  margin: 1em 2em;
	}
	.rendered_html table {
	  margin-left: auto;
	  margin-right: auto;
	  border: none;
	  border-collapse: collapse;
	  border-spacing: 0;
	  color: black;
	  font-size: 12px;
	  table-layout: fixed;
	}
	.rendered_html thead {
	  border-bottom: 1px solid black;
	  vertical-align: bottom;
	}
	.rendered_html tr,
	.rendered_html th,
	.rendered_html td {
	  text-align: right;
	  vertical-align: middle;
	  padding: 0.5em 0.5em;
	  line-height: normal;
	  white-space: normal;
	  max-width: none;
	  border: none;
	}
	.rendered_html th {
	  font-weight: bold;
	}
	.rendered_html tbody tr:nth-child(odd) {
	  background: #f5f5f5;
	}
	.rendered_html tbody tr:hover {
	  background: rgba(66, 165, 245, 0.2);
	}
	.rendered_html * + table {
	  margin-top: 1em;
	}
	.rendered_html p {
	  text-align: left;
	}
	.rendered_html * + p {
	  margin-top: 1em;
	}
	.rendered_html img {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	}
	.rendered_html * + img {
	  margin-top: 1em;
	}
	.rendered_html img,
	.rendered_html svg {
	  max-width: 100%;
	  height: auto;
	}
	.rendered_html img.unconfined,
	.rendered_html svg.unconfined {
	  max-width: none;
	}
	.rendered_html .alert {
	  margin-bottom: initial;
	}
	.rendered_html * + .alert {
	  margin-top: 1em;
	}
	[dir="rtl"] .rendered_html p {
	  text-align: right;
	}
	div.text_cell {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	}
	@media (max-width: 540px) {
	  div.text_cell > div.prompt {
	    display: none;
	  }
	}
	div.text_cell_render {
	  /*font-family: "Helvetica Neue", Arial, Helvetica, Geneva, sans-serif;*/
	  outline: none;
	  resize: none;
	  width: inherit;
	  border-style: none;
	  padding: 0.5em 0.5em 0.5em 0.4em;
	  color: #000;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	}
	a.anchor-link:link {
	  text-decoration: none;
	  padding: 0px 20px;
	  visibility: hidden;
	}
	h1:hover .anchor-link,
	h2:hover .anchor-link,
	h3:hover .anchor-link,
	h4:hover .anchor-link,
	h5:hover .anchor-link,
	h6:hover .anchor-link {
	  visibility: visible;
	}
	.text_cell.rendered .input_area {
	  display: none;
	}
	.text_cell.rendered .rendered_html {
	  overflow-x: auto;
	  overflow-y: hidden;
	}
	.text_cell.rendered .rendered_html tr,
	.text_cell.rendered .rendered_html th,
	.text_cell.rendered .rendered_html td {
	  max-width: none;
	}
	.text_cell.unrendered .text_cell_render {
	  display: none;
	}
	.text_cell .dropzone .input_area {
	  border: 2px dashed #bababa;
	  margin: -1px;
	}
	.cm-header-1,
	.cm-header-2,
	.cm-header-3,
	.cm-header-4,
	.cm-header-5,
	.cm-header-6 {
	  font-weight: bold;
	  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.cm-header-1 {
	  font-size: 185.7%;
	}
	.cm-header-2 {
	  font-size: 157.1%;
	}
	.cm-header-3 {
	  font-size: 128.6%;
	}
	.cm-header-4 {
	  font-size: 110%;
	}
	.cm-header-5 {
	  font-size: 100%;
	  font-style: italic;
	}
	.cm-header-6 {
	  font-size: 100%;
	  font-style: italic;
	}
	/*!
	*
	* IPython notebook webapp
	*
	*/
	@media (max-width: 767px) {
	  .notebook_app {
	    padding-left: 0px;
	    padding-right: 0px;
	  }
	}
	#ipython-main-app {
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  height: 100%;
	}
	div#notebook_panel {
	  margin: 0px;
	  padding: 0px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  height: 100%;
	}
	div#notebook {
	  font-size: 14px;
	  line-height: 20px;
	  overflow-y: hidden;
	  overflow-x: auto;
	  width: 100%;
	  /* This spaces the page away from the edge of the notebook area */
	  padding-top: 20px;
	  margin: 0px;
	  outline: none;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  min-height: 100%;
	}
	@media not print {
	  #notebook-container {
	    padding: 15px;
	    background-color: #fff;
	    min-height: 0;
	    -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	    box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  }
	}
	@media print {
	  #notebook-container {
	    width: 100%;
	  }
	}
	div.ui-widget-content {
	  border: 1px solid #ababab;
	  outline: none;
	}
	pre.dialog {
	  background-color: #f7f7f7;
	  border: 1px solid #ddd;
	  border-radius: 2px;
	  padding: 0.4em;
	  padding-left: 2em;
	}
	p.dialog {
	  padding: 0.2em;
	}
	/* Word-wrap output correctly.  This is the CSS3 spelling, though Firefox seems
	   to not honor it correctly.  Webkit browsers (Chrome, rekonq, Safari) do.
	 */
	pre,
	code,
	kbd,
	samp {
	  white-space: pre-wrap;
	}
	#fonttest {
	  font-family: monospace;
	}
	p {
	  margin-bottom: 0;
	}
	.end_space {
	  min-height: 100px;
	  transition: height .2s ease;
	}
	.notebook_app > #header {
	  -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	}
	@media not print {
	  .notebook_app {
	    background-color: #EEE;
	  }
	}
	kbd {
	  border-style: solid;
	  border-width: 1px;
	  box-shadow: none;
	  margin: 2px;
	  padding-left: 2px;
	  padding-right: 2px;
	  padding-top: 1px;
	  padding-bottom: 1px;
	}
	.jupyter-keybindings {
	  padding: 1px;
	  line-height: 24px;
	  border-bottom: 1px solid gray;
	}
	.jupyter-keybindings input {
	  margin: 0;
	  padding: 0;
	  border: none;
	}
	.jupyter-keybindings i {
	  padding: 6px;
	}
	.well code {
	  background-color: #ffffff;
	  border-color: #ababab;
	  border-width: 1px;
	  border-style: solid;
	  padding: 2px;
	  padding-top: 1px;
	  padding-bottom: 1px;
	}
	/* CSS for the cell toolbar */
	.celltoolbar {
	  border: thin solid #CFCFCF;
	  border-bottom: none;
	  background: #EEE;
	  border-radius: 2px 2px 0px 0px;
	  width: 100%;
	  height: 29px;
	  padding-right: 4px;
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	  /* Old browsers */
	  -webkit-box-pack: end;
	  -moz-box-pack: end;
	  box-pack: end;
	  /* Modern browsers */
	  justify-content: flex-end;
	  display: -webkit-flex;
	}
	@media print {
	  .celltoolbar {
	    display: none;
	  }
	}
	.ctb_hideshow {
	  display: none;
	  vertical-align: bottom;
	}
	/* ctb_show is added to the ctb_hideshow div to show the cell toolbar.
	   Cell toolbars are only shown when the ctb_global_show class is also set.
	*/
	.ctb_global_show .ctb_show.ctb_hideshow {
	  display: block;
	}
	.ctb_global_show .ctb_show + .input_area,
	.ctb_global_show .ctb_show + div.text_cell_input,
	.ctb_global_show .ctb_show ~ div.text_cell_render {
	  border-top-right-radius: 0px;
	  border-top-left-radius: 0px;
	}
	.ctb_global_show .ctb_show ~ div.text_cell_render {
	  border: 1px solid #cfcfcf;
	}
	.celltoolbar {
	  font-size: 87%;
	  padding-top: 3px;
	}
	.celltoolbar select {
	  display: block;
	  width: 100%;
	  height: 32px;
	  padding: 6px 12px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #555555;
	  background-color: #fff;
	  background-image: none;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  height: 30px;
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	  width: inherit;
	  font-size: inherit;
	  height: 22px;
	  padding: 0px;
	  display: inline-block;
	}
	.celltoolbar select:focus {
	  border-color: #66afe9;
	  outline: 0;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	  box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	}
	.celltoolbar select::-moz-placeholder {
	  color: #999;
	  opacity: 1;
	}
	.celltoolbar select:-ms-input-placeholder {
	  color: #999;
	}
	.celltoolbar select::-webkit-input-placeholder {
	  color: #999;
	}
	.celltoolbar select::-ms-expand {
	  border: 0;
	  background-color: transparent;
	}
	.celltoolbar select[disabled],
	.celltoolbar select[readonly],
	fieldset[disabled] .celltoolbar select {
	  background-color: #eeeeee;
	  opacity: 1;
	}
	.celltoolbar select[disabled],
	fieldset[disabled] .celltoolbar select {
	  cursor: not-allowed;
	}
	textarea.celltoolbar select {
	  height: auto;
	}
	select.celltoolbar select {
	  height: 30px;
	  line-height: 30px;
	}
	textarea.celltoolbar select,
	select[multiple].celltoolbar select {
	  height: auto;
	}
	.celltoolbar label {
	  margin-left: 5px;
	  margin-right: 5px;
	}
	.tags_button_container {
	  width: 100%;
	  display: flex;
	}
	.tag-container {
	  display: flex;
	  flex-direction: row;
	  flex-grow: 1;
	  overflow: hidden;
	  position: relative;
	}
	.tag-container > * {
	  margin: 0 4px;
	}
	.remove-tag-btn {
	  margin-left: 4px;
	}
	.tags-input {
	  display: flex;
	}
	.cell-tag:last-child:after {
	  content: "";
	  position: absolute;
	  right: 0;
	  width: 40px;
	  height: 100%;
	  /* Fade to background color of cell toolbar */
	  background: linear-gradient(to right, rgba(0, 0, 0, 0), #EEE);
	}
	.tags-input > * {
	  margin-left: 4px;
	}
	.cell-tag,
	.tags-input input,
	.tags-input button {
	  display: block;
	  width: 100%;
	  height: 32px;
	  padding: 6px 12px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #555555;
	  background-color: #fff;
	  background-image: none;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  height: 30px;
	  padding: 5px 10px;
	  font-size: 12px;
	  line-height: 1.5;
	  border-radius: 1px;
	  box-shadow: none;
	  width: inherit;
	  font-size: inherit;
	  height: 22px;
	  line-height: 22px;
	  padding: 0px 4px;
	  display: inline-block;
	}
	.cell-tag:focus,
	.tags-input input:focus,
	.tags-input button:focus {
	  border-color: #66afe9;
	  outline: 0;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	  box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6);
	}
	.cell-tag::-moz-placeholder,
	.tags-input input::-moz-placeholder,
	.tags-input button::-moz-placeholder {
	  color: #999;
	  opacity: 1;
	}
	.cell-tag:-ms-input-placeholder,
	.tags-input input:-ms-input-placeholder,
	.tags-input button:-ms-input-placeholder {
	  color: #999;
	}
	.cell-tag::-webkit-input-placeholder,
	.tags-input input::-webkit-input-placeholder,
	.tags-input button::-webkit-input-placeholder {
	  color: #999;
	}
	.cell-tag::-ms-expand,
	.tags-input input::-ms-expand,
	.tags-input button::-ms-expand {
	  border: 0;
	  background-color: transparent;
	}
	.cell-tag[disabled],
	.tags-input input[disabled],
	.tags-input button[disabled],
	.cell-tag[readonly],
	.tags-input input[readonly],
	.tags-input button[readonly],
	fieldset[disabled] .cell-tag,
	fieldset[disabled] .tags-input input,
	fieldset[disabled] .tags-input button {
	  background-color: #eeeeee;
	  opacity: 1;
	}
	.cell-tag[disabled],
	.tags-input input[disabled],
	.tags-input button[disabled],
	fieldset[disabled] .cell-tag,
	fieldset[disabled] .tags-input input,
	fieldset[disabled] .tags-input button {
	  cursor: not-allowed;
	}
	textarea.cell-tag,
	textarea.tags-input input,
	textarea.tags-input button {
	  height: auto;
	}
	select.cell-tag,
	select.tags-input input,
	select.tags-input button {
	  height: 30px;
	  line-height: 30px;
	}
	textarea.cell-tag,
	textarea.tags-input input,
	textarea.tags-input button,
	select[multiple].cell-tag,
	select[multiple].tags-input input,
	select[multiple].tags-input button {
	  height: auto;
	}
	.cell-tag,
	.tags-input button {
	  padding: 0px 4px;
	}
	.cell-tag {
	  background-color: #fff;
	  white-space: nowrap;
	}
	.tags-input input[type=text]:focus {
	  outline: none;
	  box-shadow: none;
	  border-color: #ccc;
	}
	.completions {
	  position: absolute;
	  z-index: 110;
	  overflow: hidden;
	  border: 1px solid #ababab;
	  border-radius: 2px;
	  -webkit-box-shadow: 0px 6px 10px -1px #adadad;
	  box-shadow: 0px 6px 10px -1px #adadad;
	  line-height: 1;
	}
	.completions select {
	  background: white;
	  outline: none;
	  border: none;
	  padding: 0px;
	  margin: 0px;
	  overflow: auto;
	  font-family: monospace;
	  font-size: 110%;
	  color: #000;
	  width: auto;
	}
	.completions select option.context {
	  color: #286090;
	}
	#kernel_logo_widget .current_kernel_logo {
	  display: none;
	  margin-top: -1px;
	  margin-bottom: -1px;
	  width: 32px;
	  height: 32px;
	}
	[dir="rtl"] #kernel_logo_widget {
	  float: left !important;
	  float: left;
	}
	.modal .modal-body .move-path {
	  display: flex;
	  flex-direction: row;
	  justify-content: space;
	  align-items: center;
	}
	.modal .modal-body .move-path .server-root {
	  padding-right: 20px;
	}
	.modal .modal-body .move-path .path-input {
	  flex: 1;
	}
	#menubar {
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  margin-top: 1px;
	}
	#menubar .navbar {
	  border-top: 1px;
	  border-radius: 0px 0px 2px 2px;
	  margin-bottom: 0px;
	}
	#menubar .navbar-toggle {
	  float: left;
	  padding-top: 7px;
	  padding-bottom: 7px;
	  border: none;
	}
	#menubar .navbar-collapse {
	  clear: left;
	}
	[dir="rtl"] #menubar .navbar-toggle {
	  float: right;
	}
	[dir="rtl"] #menubar .navbar-collapse {
	  clear: right;
	}
	[dir="rtl"] #menubar .navbar-nav {
	  float: right;
	}
	[dir="rtl"] #menubar .nav {
	  padding-right: 0px;
	}
	[dir="rtl"] #menubar .navbar-nav > li {
	  float: right;
	}
	[dir="rtl"] #menubar .navbar-right {
	  float: left !important;
	}
	[dir="rtl"] ul.dropdown-menu {
	  text-align: right;
	  left: auto;
	}
	[dir="rtl"] ul#new-menu.dropdown-menu {
	  right: auto;
	  left: 0;
	}
	.nav-wrapper {
	  border-bottom: 1px solid #e7e7e7;
	}
	i.menu-icon {
	  padding-top: 4px;
	}
	[dir="rtl"] i.menu-icon.pull-right {
	  float: left !important;
	  float: left;
	}
	ul#help_menu li a {
	  overflow: hidden;
	  padding-right: 2.2em;
	}
	ul#help_menu li a i {
	  margin-right: -1.2em;
	}
	[dir="rtl"] ul#help_menu li a {
	  padding-left: 2.2em;
	}
	[dir="rtl"] ul#help_menu li a i {
	  margin-right: 0;
	  margin-left: -1.2em;
	}
	[dir="rtl"] ul#help_menu li a i.pull-right {
	  float: left !important;
	  float: left;
	}
	.dropdown-submenu {
	  position: relative;
	}
	.dropdown-submenu > .dropdown-menu {
	  top: 0;
	  left: 100%;
	  margin-top: -6px;
	  margin-left: -1px;
	}
	[dir="rtl"] .dropdown-submenu > .dropdown-menu {
	  right: 100%;
	  margin-right: -1px;
	}
	.dropdown-submenu:hover > .dropdown-menu {
	  display: block;
	}
	.dropdown-submenu > a:after {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  display: block;
	  content: "\f0da";
	  float: right;
	  color: #333333;
	  margin-top: 2px;
	  margin-right: -10px;
	}
	.dropdown-submenu > a:after.fa-pull-left {
	  margin-right: .3em;
	}
	.dropdown-submenu > a:after.fa-pull-right {
	  margin-left: .3em;
	}
	.dropdown-submenu > a:after.pull-left {
	  margin-right: .3em;
	}
	.dropdown-submenu > a:after.pull-right {
	  margin-left: .3em;
	}
	[dir="rtl"] .dropdown-submenu > a:after {
	  float: left;
	  content: "\f0d9";
	  margin-right: 0;
	  margin-left: -10px;
	}
	.dropdown-submenu:hover > a:after {
	  color: #262626;
	}
	.dropdown-submenu.pull-left {
	  float: none;
	}
	.dropdown-submenu.pull-left > .dropdown-menu {
	  left: -100%;
	  margin-left: 10px;
	}
	#notification_area {
	  float: right !important;
	  float: right;
	  z-index: 10;
	}
	[dir="rtl"] #notification_area {
	  float: left !important;
	  float: left;
	}
	.indicator_area {
	  float: right !important;
	  float: right;
	  color: #777;
	  margin-left: 5px;
	  margin-right: 5px;
	  width: 11px;
	  z-index: 10;
	  text-align: center;
	  width: auto;
	}
	[dir="rtl"] .indicator_area {
	  float: left !important;
	  float: left;
	}
	#kernel_indicator {
	  float: right !important;
	  float: right;
	  color: #777;
	  margin-left: 5px;
	  margin-right: 5px;
	  width: 11px;
	  z-index: 10;
	  text-align: center;
	  width: auto;
	  border-left: 1px solid;
	}
	#kernel_indicator .kernel_indicator_name {
	  padding-left: 5px;
	  padding-right: 5px;
	}
	[dir="rtl"] #kernel_indicator {
	  float: left !important;
	  float: left;
	  border-left: 0;
	  border-right: 1px solid;
	}
	#modal_indicator {
	  float: right !important;
	  float: right;
	  color: #777;
	  margin-left: 5px;
	  margin-right: 5px;
	  width: 11px;
	  z-index: 10;
	  text-align: center;
	  width: auto;
	}
	[dir="rtl"] #modal_indicator {
	  float: left !important;
	  float: left;
	}
	#readonly-indicator {
	  float: right !important;
	  float: right;
	  color: #777;
	  margin-left: 5px;
	  margin-right: 5px;
	  width: 11px;
	  z-index: 10;
	  text-align: center;
	  width: auto;
	  margin-top: 2px;
	  margin-bottom: 0px;
	  margin-left: 0px;
	  margin-right: 0px;
	  display: none;
	}
	.modal_indicator:before {
	  width: 1.28571429em;
	  text-align: center;
	}
	.edit_mode .modal_indicator:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f040";
	}
	.edit_mode .modal_indicator:before.fa-pull-left {
	  margin-right: .3em;
	}
	.edit_mode .modal_indicator:before.fa-pull-right {
	  margin-left: .3em;
	}
	.edit_mode .modal_indicator:before.pull-left {
	  margin-right: .3em;
	}
	.edit_mode .modal_indicator:before.pull-right {
	  margin-left: .3em;
	}
	.command_mode .modal_indicator:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: ' ';
	}
	.command_mode .modal_indicator:before.fa-pull-left {
	  margin-right: .3em;
	}
	.command_mode .modal_indicator:before.fa-pull-right {
	  margin-left: .3em;
	}
	.command_mode .modal_indicator:before.pull-left {
	  margin-right: .3em;
	}
	.command_mode .modal_indicator:before.pull-right {
	  margin-left: .3em;
	}
	.kernel_idle_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f10c";
	}
	.kernel_idle_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.kernel_idle_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.kernel_idle_icon:before.pull-left {
	  margin-right: .3em;
	}
	.kernel_idle_icon:before.pull-right {
	  margin-left: .3em;
	}
	.kernel_busy_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f111";
	}
	.kernel_busy_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.kernel_busy_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.kernel_busy_icon:before.pull-left {
	  margin-right: .3em;
	}
	.kernel_busy_icon:before.pull-right {
	  margin-left: .3em;
	}
	.kernel_dead_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f1e2";
	}
	.kernel_dead_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.kernel_dead_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.kernel_dead_icon:before.pull-left {
	  margin-right: .3em;
	}
	.kernel_dead_icon:before.pull-right {
	  margin-left: .3em;
	}
	.kernel_disconnected_icon:before {
	  display: inline-block;
	  font: normal normal normal 14px/1 FontAwesome;
	  font-size: inherit;
	  text-rendering: auto;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  content: "\f127";
	}
	.kernel_disconnected_icon:before.fa-pull-left {
	  margin-right: .3em;
	}
	.kernel_disconnected_icon:before.fa-pull-right {
	  margin-left: .3em;
	}
	.kernel_disconnected_icon:before.pull-left {
	  margin-right: .3em;
	}
	.kernel_disconnected_icon:before.pull-right {
	  margin-left: .3em;
	}
	.notification_widget {
	  color: #777;
	  z-index: 10;
	  background: rgba(240, 240, 240, 0.5);
	  margin-right: 4px;
	  color: #333;
	  background-color: #fff;
	  border-color: #ccc;
	}
	.notification_widget:focus,
	.notification_widget.focus {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #8c8c8c;
	}
	.notification_widget:hover {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.notification_widget:active,
	.notification_widget.active,
	.open > .dropdown-toggle.notification_widget {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.notification_widget:active:hover,
	.notification_widget.active:hover,
	.open > .dropdown-toggle.notification_widget:hover,
	.notification_widget:active:focus,
	.notification_widget.active:focus,
	.open > .dropdown-toggle.notification_widget:focus,
	.notification_widget:active.focus,
	.notification_widget.active.focus,
	.open > .dropdown-toggle.notification_widget.focus {
	  color: #333;
	  background-color: #d4d4d4;
	  border-color: #8c8c8c;
	}
	.notification_widget:active,
	.notification_widget.active,
	.open > .dropdown-toggle.notification_widget {
	  background-image: none;
	}
	.notification_widget.disabled:hover,
	.notification_widget[disabled]:hover,
	fieldset[disabled] .notification_widget:hover,
	.notification_widget.disabled:focus,
	.notification_widget[disabled]:focus,
	fieldset[disabled] .notification_widget:focus,
	.notification_widget.disabled.focus,
	.notification_widget[disabled].focus,
	fieldset[disabled] .notification_widget.focus {
	  background-color: #fff;
	  border-color: #ccc;
	}
	.notification_widget .badge {
	  color: #fff;
	  background-color: #333;
	}
	.notification_widget.warning {
	  color: #fff;
	  background-color: #f0ad4e;
	  border-color: #eea236;
	}
	.notification_widget.warning:focus,
	.notification_widget.warning.focus {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #985f0d;
	}
	.notification_widget.warning:hover {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #d58512;
	}
	.notification_widget.warning:active,
	.notification_widget.warning.active,
	.open > .dropdown-toggle.notification_widget.warning {
	  color: #fff;
	  background-color: #ec971f;
	  border-color: #d58512;
	}
	.notification_widget.warning:active:hover,
	.notification_widget.warning.active:hover,
	.open > .dropdown-toggle.notification_widget.warning:hover,
	.notification_widget.warning:active:focus,
	.notification_widget.warning.active:focus,
	.open > .dropdown-toggle.notification_widget.warning:focus,
	.notification_widget.warning:active.focus,
	.notification_widget.warning.active.focus,
	.open > .dropdown-toggle.notification_widget.warning.focus {
	  color: #fff;
	  background-color: #d58512;
	  border-color: #985f0d;
	}
	.notification_widget.warning:active,
	.notification_widget.warning.active,
	.open > .dropdown-toggle.notification_widget.warning {
	  background-image: none;
	}
	.notification_widget.warning.disabled:hover,
	.notification_widget.warning[disabled]:hover,
	fieldset[disabled] .notification_widget.warning:hover,
	.notification_widget.warning.disabled:focus,
	.notification_widget.warning[disabled]:focus,
	fieldset[disabled] .notification_widget.warning:focus,
	.notification_widget.warning.disabled.focus,
	.notification_widget.warning[disabled].focus,
	fieldset[disabled] .notification_widget.warning.focus {
	  background-color: #f0ad4e;
	  border-color: #eea236;
	}
	.notification_widget.warning .badge {
	  color: #f0ad4e;
	  background-color: #fff;
	}
	.notification_widget.success {
	  color: #fff;
	  background-color: #5cb85c;
	  border-color: #4cae4c;
	}
	.notification_widget.success:focus,
	.notification_widget.success.focus {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #255625;
	}
	.notification_widget.success:hover {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #398439;
	}
	.notification_widget.success:active,
	.notification_widget.success.active,
	.open > .dropdown-toggle.notification_widget.success {
	  color: #fff;
	  background-color: #449d44;
	  border-color: #398439;
	}
	.notification_widget.success:active:hover,
	.notification_widget.success.active:hover,
	.open > .dropdown-toggle.notification_widget.success:hover,
	.notification_widget.success:active:focus,
	.notification_widget.success.active:focus,
	.open > .dropdown-toggle.notification_widget.success:focus,
	.notification_widget.success:active.focus,
	.notification_widget.success.active.focus,
	.open > .dropdown-toggle.notification_widget.success.focus {
	  color: #fff;
	  background-color: #398439;
	  border-color: #255625;
	}
	.notification_widget.success:active,
	.notification_widget.success.active,
	.open > .dropdown-toggle.notification_widget.success {
	  background-image: none;
	}
	.notification_widget.success.disabled:hover,
	.notification_widget.success[disabled]:hover,
	fieldset[disabled] .notification_widget.success:hover,
	.notification_widget.success.disabled:focus,
	.notification_widget.success[disabled]:focus,
	fieldset[disabled] .notification_widget.success:focus,
	.notification_widget.success.disabled.focus,
	.notification_widget.success[disabled].focus,
	fieldset[disabled] .notification_widget.success.focus {
	  background-color: #5cb85c;
	  border-color: #4cae4c;
	}
	.notification_widget.success .badge {
	  color: #5cb85c;
	  background-color: #fff;
	}
	.notification_widget.info {
	  color: #fff;
	  background-color: #5bc0de;
	  border-color: #46b8da;
	}
	.notification_widget.info:focus,
	.notification_widget.info.focus {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #1b6d85;
	}
	.notification_widget.info:hover {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #269abc;
	}
	.notification_widget.info:active,
	.notification_widget.info.active,
	.open > .dropdown-toggle.notification_widget.info {
	  color: #fff;
	  background-color: #31b0d5;
	  border-color: #269abc;
	}
	.notification_widget.info:active:hover,
	.notification_widget.info.active:hover,
	.open > .dropdown-toggle.notification_widget.info:hover,
	.notification_widget.info:active:focus,
	.notification_widget.info.active:focus,
	.open > .dropdown-toggle.notification_widget.info:focus,
	.notification_widget.info:active.focus,
	.notification_widget.info.active.focus,
	.open > .dropdown-toggle.notification_widget.info.focus {
	  color: #fff;
	  background-color: #269abc;
	  border-color: #1b6d85;
	}
	.notification_widget.info:active,
	.notification_widget.info.active,
	.open > .dropdown-toggle.notification_widget.info {
	  background-image: none;
	}
	.notification_widget.info.disabled:hover,
	.notification_widget.info[disabled]:hover,
	fieldset[disabled] .notification_widget.info:hover,
	.notification_widget.info.disabled:focus,
	.notification_widget.info[disabled]:focus,
	fieldset[disabled] .notification_widget.info:focus,
	.notification_widget.info.disabled.focus,
	.notification_widget.info[disabled].focus,
	fieldset[disabled] .notification_widget.info.focus {
	  background-color: #5bc0de;
	  border-color: #46b8da;
	}
	.notification_widget.info .badge {
	  color: #5bc0de;
	  background-color: #fff;
	}
	.notification_widget.danger {
	  color: #fff;
	  background-color: #d9534f;
	  border-color: #d43f3a;
	}
	.notification_widget.danger:focus,
	.notification_widget.danger.focus {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #761c19;
	}
	.notification_widget.danger:hover {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #ac2925;
	}
	.notification_widget.danger:active,
	.notification_widget.danger.active,
	.open > .dropdown-toggle.notification_widget.danger {
	  color: #fff;
	  background-color: #c9302c;
	  border-color: #ac2925;
	}
	.notification_widget.danger:active:hover,
	.notification_widget.danger.active:hover,
	.open > .dropdown-toggle.notification_widget.danger:hover,
	.notification_widget.danger:active:focus,
	.notification_widget.danger.active:focus,
	.open > .dropdown-toggle.notification_widget.danger:focus,
	.notification_widget.danger:active.focus,
	.notification_widget.danger.active.focus,
	.open > .dropdown-toggle.notification_widget.danger.focus {
	  color: #fff;
	  background-color: #ac2925;
	  border-color: #761c19;
	}
	.notification_widget.danger:active,
	.notification_widget.danger.active,
	.open > .dropdown-toggle.notification_widget.danger {
	  background-image: none;
	}
	.notification_widget.danger.disabled:hover,
	.notification_widget.danger[disabled]:hover,
	fieldset[disabled] .notification_widget.danger:hover,
	.notification_widget.danger.disabled:focus,
	.notification_widget.danger[disabled]:focus,
	fieldset[disabled] .notification_widget.danger:focus,
	.notification_widget.danger.disabled.focus,
	.notification_widget.danger[disabled].focus,
	fieldset[disabled] .notification_widget.danger.focus {
	  background-color: #d9534f;
	  border-color: #d43f3a;
	}
	.notification_widget.danger .badge {
	  color: #d9534f;
	  background-color: #fff;
	}
	div#pager {
	  background-color: #fff;
	  font-size: 14px;
	  line-height: 20px;
	  overflow: hidden;
	  display: none;
	  position: fixed;
	  bottom: 0px;
	  width: 100%;
	  max-height: 50%;
	  padding-top: 8px;
	  -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  /* Display over codemirror */
	  z-index: 100;
	  /* Hack which prevents jquery ui resizable from changing top. */
	  top: auto !important;
	}
	div#pager pre {
	  line-height: 1.21429em;
	  color: #000;
	  background-color: #f7f7f7;
	  padding: 0.4em;
	}
	div#pager #pager-button-area {
	  position: absolute;
	  top: 8px;
	  right: 20px;
	}
	div#pager #pager-contents {
	  position: relative;
	  overflow: auto;
	  width: 100%;
	  height: 100%;
	}
	div#pager #pager-contents #pager-container {
	  position: relative;
	  padding: 15px 0px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	}
	div#pager .ui-resizable-handle {
	  top: 0px;
	  height: 8px;
	  background: #f7f7f7;
	  border-top: 1px solid #cfcfcf;
	  border-bottom: 1px solid #cfcfcf;
	  /* This injects handle bars (a short, wide = symbol) for 
	        the resize handle. */
	}
	div#pager .ui-resizable-handle::after {
	  content: '';
	  top: 2px;
	  left: 50%;
	  height: 3px;
	  width: 30px;
	  margin-left: -15px;
	  position: absolute;
	  border-top: 1px solid #cfcfcf;
	}
	.quickhelp {
	  /* Old browsers */
	  display: -webkit-box;
	  -webkit-box-orient: horizontal;
	  -webkit-box-align: stretch;
	  display: -moz-box;
	  -moz-box-orient: horizontal;
	  -moz-box-align: stretch;
	  display: box;
	  box-orient: horizontal;
	  box-align: stretch;
	  /* Modern browsers */
	  display: flex;
	  flex-direction: row;
	  align-items: stretch;
	  line-height: 1.8em;
	}
	.shortcut_key {
	  display: inline-block;
	  width: 21ex;
	  text-align: right;
	  font-family: monospace;
	}
	.shortcut_descr {
	  display: inline-block;
	  /* Old browsers */
	  -webkit-box-flex: 1;
	  -moz-box-flex: 1;
	  box-flex: 1;
	  /* Modern browsers */
	  flex: 1;
	}
	span.save_widget {
	  height: 30px;
	  margin-top: 4px;
	  display: flex;
	  justify-content: flex-start;
	  align-items: baseline;
	  width: 50%;
	  flex: 1;
	}
	span.save_widget span.filename {
	  height: 100%;
	  line-height: 1em;
	  margin-left: 16px;
	  border: none;
	  font-size: 146.5%;
	  text-overflow: ellipsis;
	  overflow: hidden;
	  white-space: nowrap;
	  border-radius: 2px;
	}
	span.save_widget span.filename:hover {
	  background-color: #e6e6e6;
	}
	[dir="rtl"] span.save_widget.pull-left {
	  float: right !important;
	  float: right;
	}
	[dir="rtl"] span.save_widget span.filename {
	  margin-left: 0;
	  margin-right: 16px;
	}
	span.checkpoint_status,
	span.autosave_status {
	  font-size: small;
	  white-space: nowrap;
	  padding: 0 5px;
	}
	@media (max-width: 767px) {
	  span.save_widget {
	    font-size: small;
	    padding: 0 0 0 5px;
	  }
	  span.checkpoint_status,
	  span.autosave_status {
	    display: none;
	  }
	}
	@media (min-width: 768px) and (max-width: 991px) {
	  span.checkpoint_status {
	    display: none;
	  }
	  span.autosave_status {
	    font-size: x-small;
	  }
	}
	.toolbar {
	  padding: 0px;
	  margin-left: -5px;
	  margin-top: 2px;
	  margin-bottom: 5px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	}
	.toolbar select,
	.toolbar label {
	  width: auto;
	  vertical-align: middle;
	  margin-right: 2px;
	  margin-bottom: 0px;
	  display: inline;
	  font-size: 92%;
	  margin-left: 0.3em;
	  margin-right: 0.3em;
	  padding: 0px;
	  padding-top: 3px;
	}
	.toolbar .btn {
	  padding: 2px 8px;
	}
	.toolbar .btn-group {
	  margin-top: 0px;
	  margin-left: 5px;
	}
	.toolbar-btn-label {
	  margin-left: 6px;
	}
	#maintoolbar {
	  margin-bottom: -3px;
	  margin-top: -8px;
	  border: 0px;
	  min-height: 27px;
	  margin-left: 0px;
	  padding-top: 11px;
	  padding-bottom: 3px;
	}
	#maintoolbar .navbar-text {
	  float: none;
	  vertical-align: middle;
	  text-align: right;
	  margin-left: 5px;
	  margin-right: 0px;
	  margin-top: 0px;
	}
	.select-xs {
	  height: 24px;
	}
	[dir="rtl"] .btn-group > .btn,
	.btn-group-vertical > .btn {
	  float: right;
	}
	.pulse,
	.dropdown-menu > li > a.pulse,
	li.pulse > a.dropdown-toggle,
	li.pulse.open > a.dropdown-toggle {
	  background-color: #F37626;
	  color: white;
	}
	/**
	 * Primary styles
	 *
	 * Author: Jupyter Development Team
	 */
	/** WARNING IF YOU ARE EDITTING THIS FILE, if this is a .css file, It has a lot
	 * of chance of beeing generated from the ../less/[samename].less file, you can
	 * try to get back the less file by reverting somme commit in history
	 **/
	/*
	 * We'll try to get something pretty, so we
	 * have some strange css to have the scroll bar on
	 * the left with fix button on the top right of the tooltip
	 */
	@-moz-keyframes fadeOut {
	  from {
	    opacity: 1;
	  }
	  to {
	    opacity: 0;
	  }
	}
	@-webkit-keyframes fadeOut {
	  from {
	    opacity: 1;
	  }
	  to {
	    opacity: 0;
	  }
	}
	@-moz-keyframes fadeIn {
	  from {
	    opacity: 0;
	  }
	  to {
	    opacity: 1;
	  }
	}
	@-webkit-keyframes fadeIn {
	  from {
	    opacity: 0;
	  }
	  to {
	    opacity: 1;
	  }
	}
	/*properties of tooltip after "expand"*/
	.bigtooltip {
	  overflow: auto;
	  height: 200px;
	  -webkit-transition-property: height;
	  -webkit-transition-duration: 500ms;
	  -moz-transition-property: height;
	  -moz-transition-duration: 500ms;
	  transition-property: height;
	  transition-duration: 500ms;
	}
	/*properties of tooltip before "expand"*/
	.smalltooltip {
	  -webkit-transition-property: height;
	  -webkit-transition-duration: 500ms;
	  -moz-transition-property: height;
	  -moz-transition-duration: 500ms;
	  transition-property: height;
	  transition-duration: 500ms;
	  text-overflow: ellipsis;
	  overflow: hidden;
	  height: 80px;
	}
	.tooltipbuttons {
	  position: absolute;
	  padding-right: 15px;
	  top: 0px;
	  right: 0px;
	}
	.tooltiptext {
	  /*avoid the button to overlap on some docstring*/
	  padding-right: 30px;
	}
	.ipython_tooltip {
	  max-width: 700px;
	  /*fade-in animation when inserted*/
	  -webkit-animation: fadeOut 400ms;
	  -moz-animation: fadeOut 400ms;
	  animation: fadeOut 400ms;
	  -webkit-animation: fadeIn 400ms;
	  -moz-animation: fadeIn 400ms;
	  animation: fadeIn 400ms;
	  vertical-align: middle;
	  background-color: #f7f7f7;
	  overflow: visible;
	  border: #ababab 1px solid;
	  outline: none;
	  padding: 3px;
	  margin: 0px;
	  padding-left: 7px;
	  font-family: monospace;
	  min-height: 50px;
	  -moz-box-shadow: 0px 6px 10px -1px #adadad;
	  -webkit-box-shadow: 0px 6px 10px -1px #adadad;
	  box-shadow: 0px 6px 10px -1px #adadad;
	  border-radius: 2px;
	  position: absolute;
	  z-index: 1000;
	}
	.ipython_tooltip a {
	  float: right;
	}
	.ipython_tooltip .tooltiptext pre {
	  border: 0;
	  border-radius: 0;
	  font-size: 100%;
	  background-color: #f7f7f7;
	}
	.pretooltiparrow {
	  left: 0px;
	  margin: 0px;
	  top: -16px;
	  width: 40px;
	  height: 16px;
	  overflow: hidden;
	  position: absolute;
	}
	.pretooltiparrow:before {
	  background-color: #f7f7f7;
	  border: 1px #ababab solid;
	  z-index: 11;
	  content: "";
	  position: absolute;
	  left: 15px;
	  top: 10px;
	  width: 25px;
	  height: 25px;
	  -webkit-transform: rotate(45deg);
	  -moz-transform: rotate(45deg);
	  -ms-transform: rotate(45deg);
	  -o-transform: rotate(45deg);
	}
	ul.typeahead-list i {
	  margin-left: -10px;
	  width: 18px;
	}
	[dir="rtl"] ul.typeahead-list i {
	  margin-left: 0;
	  margin-right: -10px;
	}
	ul.typeahead-list {
	  max-height: 80vh;
	  overflow: auto;
	}
	ul.typeahead-list > li > a {
	  /** Firefox bug **/
	  /* see https://github.com/jupyter/notebook/issues/559 */
	  white-space: normal;
	}
	ul.typeahead-list  > li > a.pull-right {
	  float: left !important;
	  float: left;
	}
	[dir="rtl"] .typeahead-list {
	  text-align: right;
	}
	.cmd-palette .modal-body {
	  padding: 7px;
	}
	.cmd-palette form {
	  background: white;
	}
	.cmd-palette input {
	  outline: none;
	}
	.no-shortcut {
	  min-width: 20px;
	  color: transparent;
	}
	[dir="rtl"] .no-shortcut.pull-right {
	  float: left !important;
	  float: left;
	}
	[dir="rtl"] .command-shortcut.pull-right {
	  float: left !important;
	  float: left;
	}
	.command-shortcut:before {
	  content: "(command mode)";
	  padding-right: 3px;
	  color: #777777;
	}
	.edit-shortcut:before {
	  content: "(edit)";
	  padding-right: 3px;
	  color: #777777;
	}
	[dir="rtl"] .edit-shortcut.pull-right {
	  float: left !important;
	  float: left;
	}
	#find-and-replace #replace-preview .match,
	#find-and-replace #replace-preview .insert {
	  background-color: #BBDEFB;
	  border-color: #90CAF9;
	  border-style: solid;
	  border-width: 1px;
	  border-radius: 0px;
	}
	[dir="ltr"] #find-and-replace .input-group-btn + .form-control {
	  border-left: none;
	}
	[dir="rtl"] #find-and-replace .input-group-btn + .form-control {
	  border-right: none;
	}
	#find-and-replace #replace-preview .replace .match {
	  background-color: #FFCDD2;
	  border-color: #EF9A9A;
	  border-radius: 0px;
	}
	#find-and-replace #replace-preview .replace .insert {
	  background-color: #C8E6C9;
	  border-color: #A5D6A7;
	  border-radius: 0px;
	}
	#find-and-replace #replace-preview {
	  max-height: 60vh;
	  overflow: auto;
	}
	#find-and-replace #replace-preview pre {
	  padding: 5px 10px;
	}
	.terminal-app {
	  background: #EEE;
	}
	.terminal-app #header {
	  background: #fff;
	  -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	  box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.2);
	}
	.terminal-app .terminal {
	  width: 100%;
	  float: left;
	  font-family: monospace;
	  color: white;
	  background: black;
	  padding: 0.4em;
	  border-radius: 2px;
	  -webkit-box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.4);
	  box-shadow: 0px 0px 12px 1px rgba(87, 87, 87, 0.4);
	}
	.terminal-app .terminal,
	.terminal-app .terminal dummy-screen {
	  line-height: 1em;
	  font-size: 14px;
	}
	.terminal-app .terminal .xterm-rows {
	  padding: 10px;
	}
	.terminal-app .terminal-cursor {
	  color: black;
	  background: white;
	}
	.terminal-app #terminado-container {
	  margin-top: 20px;
	}
	/*# sourceMappingURL=style.min.css.map */
	    </style>
	<style type="text/css">
	    .highlight .hll { background-color: #ffffcc }
	.highlight  { background: #f8f8f8; }
	.highlight .c { color: #408080; font-style: italic } /* Comment */
	.highlight .err { border: 1px solid #FF0000 } /* Error */
	.highlight .k { color: #008000; font-weight: bold } /* Keyword */
	.highlight .o { color: #666666 } /* Operator */
	.highlight .ch { color: #408080; font-style: italic } /* Comment.Hashbang */
	.highlight .cm { color: #408080; font-style: italic } /* Comment.Multiline */
	.highlight .cp { color: #BC7A00 } /* Comment.Preproc */
	.highlight .cpf { color: #408080; font-style: italic } /* Comment.PreprocFile */
	.highlight .c1 { color: #408080; font-style: italic } /* Comment.Single */
	.highlight .cs { color: #408080; font-style: italic } /* Comment.Special */
	.highlight .gd { color: #A00000 } /* Generic.Deleted */
	.highlight .ge { font-style: italic } /* Generic.Emph */
	.highlight .gr { color: #FF0000 } /* Generic.Error */
	.highlight .gh { color: #000080; font-weight: bold } /* Generic.Heading */
	.highlight .gi { color: #00A000 } /* Generic.Inserted */
	.highlight .go { color: #888888 } /* Generic.Output */
	.highlight .gp { color: #000080; font-weight: bold } /* Generic.Prompt */
	.highlight .gs { font-weight: bold } /* Generic.Strong */
	.highlight .gu { color: #800080; font-weight: bold } /* Generic.Subheading */
	.highlight .gt { color: #0044DD } /* Generic.Traceback */
	.highlight .kc { color: #008000; font-weight: bold } /* Keyword.Constant */
	.highlight .kd { color: #008000; font-weight: bold } /* Keyword.Declaration */
	.highlight .kn { color: #008000; font-weight: bold } /* Keyword.Namespace */
	.highlight .kp { color: #008000 } /* Keyword.Pseudo */
	.highlight .kr { color: #008000; font-weight: bold } /* Keyword.Reserved */
	.highlight .kt { color: #B00040 } /* Keyword.Type */
	.highlight .m { color: #666666 } /* Literal.Number */
	.highlight .s { color: #BA2121 } /* Literal.String */
	.highlight .na { color: #7D9029 } /* Name.Attribute */
	.highlight .nb { color: #008000 } /* Name.Builtin */
	.highlight .nc { color: #0000FF; font-weight: bold } /* Name.Class */
	.highlight .no { color: #880000 } /* Name.Constant */
	.highlight .nd { color: #AA22FF } /* Name.Decorator */
	.highlight .ni { color: #999999; font-weight: bold } /* Name.Entity */
	.highlight .ne { color: #D2413A; font-weight: bold } /* Name.Exception */
	.highlight .nf { color: #0000FF } /* Name.Function */
	.highlight .nl { color: #A0A000 } /* Name.Label */
	.highlight .nn { color: #0000FF; font-weight: bold } /* Name.Namespace */
	.highlight .nt { color: #008000; font-weight: bold } /* Name.Tag */
	.highlight .nv { color: #19177C } /* Name.Variable */
	.highlight .ow { color: #AA22FF; font-weight: bold } /* Operator.Word */
	.highlight .w { color: #bbbbbb } /* Text.Whitespace */
	.highlight .mb { color: #666666 } /* Literal.Number.Bin */
	.highlight .mf { color: #666666 } /* Literal.Number.Float */
	.highlight .mh { color: #666666 } /* Literal.Number.Hex */
	.highlight .mi { color: #666666 } /* Literal.Number.Integer */
	.highlight .mo { color: #666666 } /* Literal.Number.Oct */
	.highlight .sa { color: #BA2121 } /* Literal.String.Affix */
	.highlight .sb { color: #BA2121 } /* Literal.String.Backtick */
	.highlight .sc { color: #BA2121 } /* Literal.String.Char */
	.highlight .dl { color: #BA2121 } /* Literal.String.Delimiter */
	.highlight .sd { color: #BA2121; font-style: italic } /* Literal.String.Doc */
	.highlight .s2 { color: #BA2121 } /* Literal.String.Double */
	.highlight .se { color: #BB6622; font-weight: bold } /* Literal.String.Escape */
	.highlight .sh { color: #BA2121 } /* Literal.String.Heredoc */
	.highlight .si { color: #BB6688; font-weight: bold } /* Literal.String.Interpol */
	.highlight .sx { color: #008000 } /* Literal.String.Other */
	.highlight .sr { color: #BB6688 } /* Literal.String.Regex */
	.highlight .s1 { color: #BA2121 } /* Literal.String.Single */
	.highlight .ss { color: #19177C } /* Literal.String.Symbol */
	.highlight .bp { color: #008000 } /* Name.Builtin.Pseudo */
	.highlight .fm { color: #0000FF } /* Name.Function.Magic */
	.highlight .vc { color: #19177C } /* Name.Variable.Class */
	.highlight .vg { color: #19177C } /* Name.Variable.Global */
	.highlight .vi { color: #19177C } /* Name.Variable.Instance */
	.highlight .vm { color: #19177C } /* Name.Variable.Magic */
	.highlight .il { color: #666666 } /* Literal.Number.Integer.Long */
	    </style>
	
	
	<style type="text/css">
	/* Overrides of notebook CSS for static HTML export */
	body {
	  overflow: visible;
	  padding: 8px;
	}
	
	div#notebook {
	  overflow: visible;
	  border-top: none;
	}@media print {
	  div.cell {
	    display: block;
	    page-break-inside: avoid;
	  } 
	  div.output_wrapper { 
	    display: block;
	    page-break-inside: avoid; 
	  }
	  div.output { 
	    display: block;
	    page-break-inside: avoid; 
	  }
	}
	</style>
	
	<!-- Custom stylesheet, it must be in the same directory as the html file -->
	<link rel="stylesheet" href="custom.css">
	
	<!-- Loading mathjax macro -->
	<!-- Load mathjax -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-AMS_HTML"></script>
	    <!-- MathJax configuration -->
	    <script type="text/x-mathjax-config">
	    MathJax.Hub.Config({
	        tex2jax: {
	            inlineMath: [ ['$','$'], ["\\(","\\)"] ],
	            displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
	            processEscapes: true,
	            processEnvironments: true
	        },
	        // Center justify equations in code and markdown cells. Elsewhere
	        // we use CSS to left justify single line equations in code cells.
	        displayAlign: 'center',
	        "HTML-CSS": {
	            styles: {'.MathJax_Display': {"margin": 0}},
	            linebreaks: { automatic: true }
	        }
	    });
	    </script>
	    <!-- End of mathjax configuration --></head>
	<body>
	  <div tabindex="-1" id="notebook" class="border-box-sizing">
	    <div class="container" id="notebook-container">
	
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[1]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">tensorflow.compat.v1</span> <span class="k">as</span> <span class="nn">tf</span>
	<span class="kn">import</span> <span class="nn">matplotlib.pyplot</span> <span class="k">as</span> <span class="nn">plt</span>
	<span class="kn">import</span> <span class="nn">numpy</span> <span class="k">as</span> <span class="nn">np</span>
	<span class="kn">from</span> <span class="nn">tensorflow.python.framework</span> <span class="kn">import</span> <span class="n">ops</span>
	<span class="n">ops</span><span class="o">.</span><span class="n">reset_default_graph</span><span class="p">()</span>
	<span class="n">tf</span><span class="o">.</span><span class="n">disable_eager_execution</span><span class="p">()</span>
	<span class="n">sess</span> <span class="o">=</span> <span class="n">tf</span><span class="o">.</span><span class="n">Session</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stderr output_text">
	<pre>/home/ma-user/anaconda3/envs/TensorFlow-2.1.0/lib/python3.6/site-packages/h5py/__init__.py:36: FutureWarning: Conversion of the second argument of issubdtype from `float` to `np.floating` is deprecated. In future, it will be treated as `np.float64 == np.dtype(float).type`.
	  from ._conv import register_converters as _register_converters
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[2]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">relu</span><span class="p">([</span><span class="o">-</span><span class="mf">3.</span><span class="p">,</span><span class="mf">3.</span><span class="p">,</span><span class="mf">10.</span><span class="p">])))</span>
	<span class="n">y_relu</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">relu</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[ 0.  3. 10.]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[3]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_relu</span><span class="p">,</span> <span class="s1">&#39;b:&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ReLU&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">5</span><span class="p">,</span><span class="mi">11</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[4]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">relu6</span><span class="p">([</span><span class="o">-</span><span class="mf">3.</span><span class="p">,</span><span class="mf">3.</span><span class="p">,</span><span class="mf">10.</span><span class="p">])))</span>
	<span class="n">y_relu6</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">relu6</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[0. 3. 6.]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[6]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_relu6</span><span class="p">,</span> <span class="s1">&#39;g-.&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ReLU6&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">5</span><span class="p">,</span><span class="mi">11</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[7]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">sigmoid</span><span class="p">([</span><span class="o">-</span><span class="mf">1.</span><span class="p">,</span><span class="mf">0.</span><span class="p">,</span><span class="mf">1.</span><span class="p">])))</span>
	<span class="n">y_sigmoid</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">sigmoid</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[0.26894143 0.5        0.7310586 ]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[8]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_sigmoid</span><span class="p">,</span> <span class="s1">&#39;y-..&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Sigmoid&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[9]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">tanh</span><span class="p">([</span><span class="o">-</span><span class="mf">1.</span><span class="p">,</span><span class="mf">0.</span><span class="p">,</span><span class="mf">1.</span><span class="p">])))</span>
	<span class="n">y_tanh</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">tanh</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[-0.7615942  0.         0.7615942]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[10]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_tanh</span><span class="p">,</span> <span class="s1">&#39;b:&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Tanh&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[11]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">softsign</span><span class="p">([</span><span class="o">-</span><span class="mf">1.</span><span class="p">,</span><span class="mf">0.</span><span class="p">,</span><span class="mf">1.</span><span class="p">])))</span>
	<span class="n">y_softsign</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">softsign</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[-0.5  0.   0.5]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[13]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_softsign</span><span class="p">,</span> <span class="s1">&#39;g-.&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Softsign&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[18]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">15</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">softplus</span><span class="p">([</span><span class="o">-</span><span class="mf">1.</span><span class="p">,</span><span class="mf">0.</span><span class="p">,</span><span class="mf">1.</span><span class="p">])))</span>
	<span class="n">y_softplus</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">softplus</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[0.31326166 0.6931472  1.3132616 ]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[19]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_softplus</span><span class="p">,</span> <span class="s1">&#39;r--&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Softplus&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span><span class="mi">15</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[20]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">x_vals</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="n">start</span><span class="o">=-</span><span class="mi">10</span><span class="p">,</span><span class="n">stop</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="n">num</span><span class="o">=</span><span class="mi">100</span><span class="p">)</span>
	<span class="nb">print</span><span class="p">(</span><span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">elu</span><span class="p">([</span><span class="o">-</span><span class="mf">1.</span><span class="p">,</span> <span class="mf">0.</span><span class="p">,</span> <span class="mf">1.</span><span class="p">])))</span>
	<span class="n">y_elu</span> <span class="o">=</span> <span class="n">sess</span><span class="o">.</span><span class="n">run</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">nn</span><span class="o">.</span><span class="n">elu</span><span class="p">(</span><span class="n">x_vals</span><span class="p">))</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	<div class="output_subarea output_stream output_stdout output_text">
	<pre>[-0.63212055  0.          1.        ]
	</pre>
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[22]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_elu</span><span class="p">,</span> <span class="s1">&#39;k-&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ExpLU&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mf">0.5</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span><span class="mi">10</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[12]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_softplus</span><span class="p">,</span> <span class="s1">&#39;r--&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Softplus&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_relu</span><span class="p">,</span> <span class="s1">&#39;b:&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ReLU&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_relu6</span><span class="p">,</span> <span class="s1">&#39;g-.&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ReLU6&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_elu</span><span class="p">,</span> <span class="s1">&#39;k-&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;ExpLU&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mf">0.5</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">5</span><span class="p">,</span><span class="mi">11</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[11]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span><span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_sigmoid</span><span class="p">,</span> <span class="s1">&#39;r--&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Sigmoid&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_tanh</span><span class="p">,</span> <span class="s1">&#39;b:&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Tanh&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">plot</span><span class="p">(</span><span class="n">x_vals</span><span class="p">,</span> <span class="n">y_softsign</span><span class="p">,</span> <span class="s1">&#39;g-.&#39;</span><span class="p">,</span> <span class="n">label</span><span class="o">=</span><span class="s1">&#39;Softsign&#39;</span><span class="p">,</span> <span class="n">linewidth</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">ylim</span><span class="p">([</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span><span class="mi">2</span><span class="p">])</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">legend</span><span class="p">(</span><span class="n">loc</span><span class="o">=</span><span class="s1">&#39;upper left&#39;</span><span class="p">)</span>
	<span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	<div class="output_wrapper">
	<div class="output">
	
	
	<div class="output_area">
	
	    <div class="prompt"></div>
	
	
	
	
	<div class="output_png output_subarea ">
	<img src="data:image/png;base64,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
	"
	>
	</div>
	
	</div>
	
	</div>
	</div>
	
	</div>
	<div class="cell border-box-sizing code_cell rendered">
	<div class="input">
	<div class="prompt input_prompt">In&nbsp;[&nbsp;]:</div>
	<div class="inner_cell">
	    <div class="input_area">
	<div class=" highlight hl-ipython3"><pre><span></span> 
	</pre></div>
	
	    </div>
	</div>
	</div>
	
	</div>
	    </div>
	  </div>
	</body>
	
	 
	
	
	</html>
