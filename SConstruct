import os
import SCons

# Load custom tools
SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('contrib'))

# Do not load tools into the default environment
DefaultEnvironment(tools=[])

# Create Build Environment
env = Environment(tools=['tex', 'latex', 'pdflatex', 'pdftex', 'makotemplate'])
Export('env')
doc = SConscript('src/SConscript', variant_dir='build', duplicate=1)
Install('dist', doc)
