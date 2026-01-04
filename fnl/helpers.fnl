(fn yank [stuff]
	(if stuff
		(do
			(vim.fn.setreg "+" stuff)
			(print "Yanked:" stuff))
		(print "Nothing to yank.")))

(fn current-file-and-line []
  (let [current-file (vim.fn.expand "%")
			 current-line (vim.fn.line ".")]
			 (.. current-file ":" current-line)))

{
	: yank
	: current-file-and-line
}
