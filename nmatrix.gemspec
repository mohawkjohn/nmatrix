lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'nmatrix/version'

Gem::Specification.new do |gem|
  gem.name = "nmatrix"
  gem.version = NMatrix::VERSION
  gem.summary = "NMatrix is an experimental linear algebra library for Ruby, written mostly in C." 
  gem.description = "NMatrix is an experimental linear algebra library for Ruby, written mostly in C." 
  gem.homepage = 'http://sciruby.com'
  gem.authors = ['John Woods']
  gem.email =  ['john.o.woods@gmail.com']
  gem.post_install_message = <<-EOF
***********************************************************
Welcome to SciRuby: Tools for Scientific Computing in Ruby!

                     *** WARNING ***
Please be aware that NMatrix is in ALPHA status. If you're
thinking of using NMatrix to write mission critical code,
such as for driving a car or flying a space shuttle, you
may wish to choose other software (for now).

NMatrix requires a C compiler, and has been tested only
with GCC 4.6.1. We are happy to accept contributions
which improve the portability of this project.

Also required is ATLAS. Most Linux distributions and Mac
versions include ATLAS, but you may wish to compile it
yourself.

More explicit instructions for NMatrix and SciRuby should
be available on the SciRuby website, sciruby.com, or
through our mailing list (which can be found on our web-
site).

Thanks for trying out NMatrix! Happy coding!

***********************************************************
EOF

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.extensions = ['ext/nmatrix/extconf.rb']
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9.2'

  #gem.add_dependency 'csquare', '~>0.0.2'

  gem.add_development_dependency 'rake', '~>0.9'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec', '~>2.9.0'
  gem.add_development_dependency 'pry', '~>0.9.9'
  gem.add_development_dependency 'guard-rspec', '~>0.7.0'
  gem.add_development_dependency 'rake-compiler', '~>0.8.1'
end

