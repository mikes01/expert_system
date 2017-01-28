require 'ruby-prolog'
require 'byebug'

class Expert

  def initialize
    @c = RubyProlog::Core.new
    initialize_database
  end
 

  def initialize_database 
    @c.instance_eval do
      language['ruby'].fact
      simple['ruby'].fact
      typed['ruby', 'dynamically'].fact
      duck_typing['ruby', 'yes'].fact
      lambdas['ruby', 'yes'].fact
      type_inference['ruby', 'yes'].fact
      pattern_matching['ruby', 'no'].fact
      lazy_evaluation['ruby', 'no'].fact
      actors['ruby', 'yes'].fact
      paradigm['ruby', 'object_oriented'].fact
      paradigm['ruby', 'metaprogramming'].fact
      paradigm['ruby', 'imperative'].fact
      paradigm['ruby', functional].fact
      type['ruby', 'interpreted'].fact
      platform['ruby', 'web'].fact


      language['c'].fact
      simple['c'].fact
      typed['c', 'statically'].fact
      duck_typing['c', 'no'].fact
      lambdas['c', 'no'].fact
      type_inference['c', 'no'].fact
      pattern_matching['c', 'no'].fact
      lazy_evaluation['c', 'no'].fact
      actors['c', 'no'].fact
      paradigm['c', 'metaprogramming'].fact
      paradigm['c', 'imperative'].fact
      type['c', 'run_directly'].fact

      language['scala'].fact
      complicated['scala'].fact
      typed['scala', 'statically'].fact
      pattern_matching['scala', 'yes'].fact
      lambdas['scala', 'yes'].fact
      type_inference['scala', 'yes'].fact
      duckTyping['scala', 'no'].fact
      paradigm['scala', 'object_oriented'].fact
      paradigm['scala', 'lazy'].fact
      paradigm['scala', 'concurrent'].fact
      paradigm['scala', 'metaprogramming'].fact
      paradigm['scala', 'imperative'].fact
      paradigm['scala', 'functional'].fact
      type['scala', 'virtual_machine'].fact
      platform['scala', 'web'].fact

      language['csharp'].fact
      simple['csharp'].fact
      typed['csharp', 'statically'].fact
      pattern_matching['csharp', 'yes'].fact
      lambdas['csharp', 'yes'].fact
      typeInference['csharp', 'yes'].fact
      duckTyping['csharp', 'no'].fact
      actors['csharp', 'no'].fact
      lazyEvaluation['csharp', 'no'].fact
      macros['csharp', 'no'].fact
      paradigm['csharp', 'object_oriented'].fact
      paradigm['csharp', 'imperative'].fact
      type['csharp', 'run_directly'].fact
      platform['csharp', 'web'].fact
      platform['csharp', 'mobile'].fact

      language['java'].fact
      simple['java'].fact
      typed['java', 'statically'].fact
      patternMatching['java', 'no'].fact
      lambdas['java', 'yes'].fact
      typeInference['java', 'no'].fact
      duckTyping['java', 'no'].fact
      actors['java', 'no'].fact
      lazyEvaluation['java', 'no'].fact
      macros['java', 'no'].fact
      paradigm['java', 'object_oriented'].fact
      paradigm['java', 'imperative'].fact
      type['java', 'virtual_machine'].fact
      platform['java', 'web'].fact
      platform['java', 'mobile'].fact

      language['haskell'].fact
      complicated['haskell'].fact
      typed['haskell', 'statically'].fact
      pattern_matching['haskell', 'yes'].fact
      lambdas['haskell', 'yes'].fact
      type_inference['haskell', 'yes'].fact
      duck_typing['haskell', 'yes'].fact
      actors['haskell', 'no'].fact
      macros['haskell', 'no'].fact
      paradigm['haskell', 'functional'].fact
      paradigm['haskell', 'lazy'].fact
      type['haskell', 'run_directly'].fact

      language['python'].fact
      simple['python'].fact
      typed['python', 'dynamically'].fact
      pattern_matching['python', 'no'].fact
      type_inference['python', 'no'].fact
      lambdas['python', 'yes'].fact
      duck_typing['python', 'yes'].fact
      actors['python', 'no'].fact
      lazy_evaluation['python', 'no'].fact
      macros['python', 'no'].fact
      paradigm['python', 'object_oriented'].fact
      paradigm['python', 'imperative'].fact
      type['python', 'interpreted'].fact
      platform['python', 'web'].fact

      language['lisp'].fact
      complicated['lisp'].fact
      typed['dynamically'].fact
      lambdas['lisp', 'yes'].fact
      pattern_matching['lisp', 'yes'].fact
      type_inheritance['lisp', 'no'].fact
      lazy_evaluation['lisp', 'no'].fact
      actors['lisp', 'no'].fact
      paradigm['lisp', 'object_oriented'].fact
      paradigm['lisp', 'metaprogramming'].fact
      paradigm['lisp', 'functional'].fact
      type['lisp', 'run_directly'].fact

      language['erlang'].fact
      complicated['erlang'].fact
      typed['erlang', 'dynamically'].fact
      pattern_matching['erlang', 'yes'].fact
      lambdas['erlang', 'yes'].fact
      type_inference['erlang', 'yes'].fact
      duck_dyping['erlang', 'yes'].fact
      lazy_evaluation['erlang', 'no'].fact
      encapsulation['erlang', 'no'].fact
      macros['erlang', 'no'].fact
      paradigm['erlang', 'functional'].fact
      paradigm['erlang', 'concurrent'].fact
      type['erlang', 'virtual_machine'].fact

      simple_syntax[:X, 'yes'] << simple[:X]
      clear_documentation[:X, 'yes'] << simple[:X]

      simple_syntax[:X, 'no'] << complicated[:X]
      clear_documentation[:X, 'no'] << complicated[:X]

      types_resolved_during_compilation[:X, 'yes'] << typed[:X, 'dynamically']
      types_resolved_during_compilation[:X, 'no'] << typed[:X, 'statically']

      type_inheritance[:X, 'yes'] << paradigm[:X, 'object_oriented']
      encapsulation[:X, 'yes'] << paradigm[:X, 'object_oriented']

      mutation[:X, 'yes'] << paradigm[:X, 'imperative']
      side_effects[:X, 'yes'] << paradigm[:X, 'imperative'] 

      side_effects[:X, 'no'] << paradigm[:X, 'functional']
      mutation[:X, 'no'] << paradigm[:X, 'functional']

      paradigm[:X, 'concurrent'] << actors[:X, 'yes']

      paradigm[:X, 'metaprogramming'] << macros[:X, 'yes']

      paradigm[:X, 'lazy'] << lazy_evaluation[:X, yes]
    end
  end

  def resolve(params)
    attrs = [@c.language[:X]]
    params.each do |key, value|
      attrs << @c.send(key)[:X, value] unless value == "neutral"
    end
    extract_languages(@c.query(*attrs))
  end

  def extract_languages(results)
    (results.map { |l| l.first.args.first }).uniq
  end
end