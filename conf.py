# -*- coding: utf-8 -*-

import sys
import os
sys.path.insert(0, os.path.abspath("../../mlms/"))

project = 'ml-ms'
copyright = '- Wei MEI.'
author = 'nickcafferry-wei_mei'

version = '0.1.0'
release = ''

extensions = [
    'sphinx.ext.todo',
    'sphinx.ext.githubpages',
    'sphinx.ext.mathjax',
    'sphinx.ext.intersphinx',
    'sphinx.ext.autodoc', 
    'sphinx.ext.coverage',
    'sphinx.ext.napoleon',
    'sphinx_rtd_theme'
]

autoclass_content = 'both'
mathjax_path = "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"

templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
language = 'English'
html_search_language = 'English'
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'remain']
pygments_style = 'default'

html_static_path = ['assets']
html_theme = 'sphinx_rtd_theme'
html_favicon = 'GCC.png'
html_logo = 'GCC.png'
html_theme_options = {
    'logo_only': False,
    'style_nav_header_background': '#343131',
}
