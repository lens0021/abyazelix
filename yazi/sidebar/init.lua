--- Makes the status bar way more readable (but you don't need lua as a dependency, so no worries)
function Status:render(area)
	self.area = area

	local line = ui.Line { self:percentage(), self:position() }
	return {
		ui.Paragraph(area, { line }):align(ui.Paragraph.CENTER),
	}
end
