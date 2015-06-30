root_section_node = SectionNode.create()
home_section      = Section.create(name: "My Site", path: "/", section_node: root_section_node)
home_page         = Page.create(name: "Home", path: "/home", template_file_name: "default.html.erb", section_node: root_section_node)

text_content_block = TextContentBlock.create(body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Connector.create(page: home_page, connectable: text_content_block, container: "main")

text_with_title_content_block = TextWithTitleContentBlock.create(body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", title: "Welcome")
Connector.create(page: home_page, connectable: text_with_title_content_block, container: "main")