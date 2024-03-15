(fn yank [stuff]
	(if stuff
		(do
			(vim.fn.setreg "+" stuff)
			(print "Yanked:" stuff))
		(print "Nothing to yank.")))

{
	: yank
}
