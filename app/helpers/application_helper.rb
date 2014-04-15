module ApplicationHelper

	# returns the page title on a per-page basis.
	def full_title(page_title)
		base_title = "Super Awesome To Do List"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
end
