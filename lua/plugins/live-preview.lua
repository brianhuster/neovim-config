return {
	'brianhuster/live-preview.nvim',
	branch = "dev",
	ft = { 'html', 'markdown', 'asciidoc' },
	config = function() require('live-preview').setup() end,
}
