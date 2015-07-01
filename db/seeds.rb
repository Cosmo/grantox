home_section      = Section.create(name: "My Site", path: "/home")
home_page         = Page.new(name: "Home", path: "/home", template_file_name: "default.html.erb")
home_section.children << home_page

projects_section = Section.create(name: "Projects", path: "/projects")
home_section.children << projects_section

projects_2014_section = Section.create(name: "2014", path: "/projects/2014")
projects_section.children << projects_2014_section

projects_2015_section = Section.create(name: "2015", path: "/projects/2015")
projects_section.children << projects_2015_section



jobs_section = Section.create(name: "Jobs", path: "/jobs")
home_section.children << jobs_section

company_section = Section.create(name: "Company", path: "/company")
home_section.children << company_section

company_page    = Page.create(name: "Company", path: "/company", template_file_name: "default.html.erb")
company_section.children << company_page

about_us_page    = Page.create(name: "About Us", path: "/company/about_us", template_file_name: "default.html.erb")
company_section.children << about_us_page

history_page    = Page.create(name: "History", path: "/company/history", template_file_name: "default.html.erb")
company_section.children << history_page



## Home Content #########

text_with_title_content_block = TextWithTitleContentBlock.create(name: "welcome", title: "Welcome", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Connector.create(page: home_page, connectable: text_with_title_content_block, container: "main")

text_content_block = TextContentBlock.create(name: "cool", body: "Ok, cool cool.")
Connector.create(page: home_page, connectable: text_content_block, container: "main")
