
env = Environment()

includes = '''
              .
              ./lib/include
              ./lib/include/base
              ./lib/include/tools
              ./lib/include/user-api
              ./lib/include/dataflow-analysis
              ./lib/include/dataflow-specification-language
              ./lib/include/design-space-exploration
              ./lib/include/cost-analysis
              ./lib/include/abstract-hardware-model
              ./lib/include/heterogeneous-space-exploration
              ./lib/src
              /opt/homebrew/Cellar/boost/1.81.0_1/include              
'''

env.Append(LINKFLAGS=['-L/opt/homebrew/lib', '-lboost_program_options', '-lboost_filesystem', '-lboost_system'])
env.Append(CXXFLAGS=['-std=c++17', '-lboost_program_options',  '-lboost_filesystem', '-lboost_system', '-O2'])
env.Append(LIBS=['-lboost_program_options',  '-lboost_filesystem', '-lboost_system' ])

env.Append(CPPPATH = Split(includes))
env.Program('maestro', ['XRBench-MAESTRO.cpp', 'lib/src/BASE_base-objects.cpp' ])

