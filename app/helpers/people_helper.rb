module PeopleHelper

  def project_title_links(project)
    content_tag :h1 do
      [project.title,
        link_to_icon('show', project_path(project.id)), # or just project same in rails
        link_to_icon('edit', edit_project_path(project)), # or project.id
        link_to_icon('destroy', project_url(project.id), {
          :confirm => 'Are you sure?',
          :method => :delete
          }),
      ].join(' ').html_safe
    end
  end

end
