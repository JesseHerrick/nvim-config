(fn extract-elixir-module-parts [full-module-name]
	"Given an Elixir module as a string, extracts the parts into a sequential table."
	(assert full-module-name)
	(icollect [part (full-module-name:gmatch "([^%.]+)")]
		part))

(fn get-full-elixir-module []
	"Extracts the module from a given Elixir source file."
	(let [first-line (vim.fn.getline 1)]
		(first-line:match "defmodule%s+([%w_%.]+)%s+do")))

(fn current-absolute-module []
	"Returns the current absolute module of the current file. For example, in module Foo.Bar.Baz, returns 'Foo.Bar.Baz'."
	(get-full-elixir-module))

(fn current-local-module []
	"Returns the current local module of the current file. For example, in module Foo.Bar.Baz, returns 'Baz'."
	(let [module-parts (-?> (get-full-elixir-module) (extract-elixir-module-parts))]
		(?. module-parts (length module-parts))))

{
	: current-absolute-module
	: current-local-module
}
