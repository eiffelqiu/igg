module Ext
  module MethodHooker
    def self.included(base)
      base.extend(ClassMethods)
    end

    def self.extended(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def before_each_method type, &block
        singleton = class << self; self; end
        case type
          when :instance
            this = self
            singleton.instance_eval do
              define_method :method_added do |name|
                last = instance_variable_get(:@__last_methods_added)
                return if last and last.include?(name)
                with = :"#{name}_with_before_each_method"
                without = :"#{name}_without_before_each_method"
                instance_variable_set(:@__last_methods_added, [name, with, without])
                this.class_eval do
                  define_method with do |*args, &blk|
                    instance_exec(name, args, blk, &block)
                    send without, *args, &blk
                  end
                  alias_method without, name
                  alias_method name, with
                end
                instance_variable_set(:@__last_methods_added, nil)
              end
            end
          when :class
            this = self
            singleton.instance_eval do
              define_method :singleton_method_added do |name|
                return if name == :singleton_method_added
                last = instance_variable_get(:@__last_singleton_methods_added)
                return if last and last.include?(name)
                with = :"#{name}_with_before_each_method"
                without = :"#{name}_without_before_each_method"
                instance_variable_set(:@__last_singleton_methods_added, [name, with, without])
                singleton.class_eval do
                  define_method with do |*args, &blk|
                    instance_exec(name, args, blk, &block)
                    send without, *args, &blk
                  end
                  alias_method without, name
                  alias_method name, with
                end
                instance_variable_set(:@__last_singleton_methods_added, nil)
              end
            end
        end
      end

      def before_class_method &block
        before_each_method :class, &block
      end

      def before_instance_method &block
        before_each_method :instance, &block
      end
    end
  end
end
