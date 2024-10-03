return {
	'brianhuster/live-preview.nvim',
	branch = "dev",
	ft = { 'html', 'markdown', 'asciidoc' },
	opts = {
		commands = {
			start = 'LiveStart', -- Command to start the live preview server and open the default browser. Default is 'LivePreview'
			stop = 'LiveStop', -- Command to stop the live preview. Default is 'StopPreview'
		},
	},
}
