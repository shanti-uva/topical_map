module ApplicationHelper
  def stylesheet_files
    ['base', 'language_support', 'authenticated_system','tmb', 'tmb_implicit'] + super
  end
  
  def javascript_files
    [:defaults]
  end
  
  def stylesheets
    return stylesheet_link_tag(*stylesheet_files)
  end
  
  def javascripts
    return javascript_include_tag(*javascript_files)
  end
  
  def join_with_and(list)
    size = list.size
    case size
    when 0 then nil
    when 1 then list.first
    when 2 then list.join(' and ')
    when 3 then [list[0..size-2].join(', '), list[size-1]].join(', and ')
    end
  end
  
  def main_navigation_items()
    return @main_navigation_items if @main_navigation_items
    # basic menu options
    @main_navigation_items = [ 
    	{ :id => :home, :text => 'Home', :link => root_path },
    ]
    @current_nav_item = :home
    
    return @main_navigation_items
  end

  def secondary_navigation_items()
    return ''
  end
  
  def site_title(opts={:html=>true})
    opts[:html] ? 'SHANTI UVa Kmaps' : 'SHANTI UVa Kmaps' 
  end

  def banner_title(opts={:html=>true})
    opts[:html] ? 'SHANTI - Kmaps' : 'SHANTI - Kmaps'
  end
  
  def page_title()
    return "" #if @current_nav_item == :users

    # Supply reasonable default if no current_nav_item is given.
    if @current_nav_item
      main_navigation_items.select { |item| item[:id] == @current_nav_item }.first[:text]
    else
      ''
    end
  end
  
  
  def login_status_links()
    return   "<div id=\"login-status\">" +
       "#{login_status}#{'&nbsp;'*3}" +
       language_option_links +
       "</div>\n"
  end
  
  # this method relies on the authenticated_system plugin
  def login_status
      if !logged_in?
        return "#{link_to 'Login', authenticated_system_login_path}."
      else
        return "#{current_user.login}. #{link_to 'Logout', authenticated_system_logout_path}."
      end
  end
  
  # this method relies on the complex scripts plugin
  def language_option_links
    render(:partial => 'sessions/language_options')
  end
  
  def tagged_tinymce_script
    str = "<script type='text/javascript'>"+ "\n"
    str += "//<![CDATA[" + "\n"
    str += "tinyMCE.init({" + "\n"
    str += "editor_selector : 'mceEditor'," + "\n"
    str += "height : '270px'," + "\n"
    str += "mode : 'textareas'," + "\n"
    str += "noneditable_leave_contenteditable : 'true'," + "\n"
    str += "plugins : 'contextmenu,paste,media,fullscreen,template,noneditable, table, spellchecker'," + "\n"
    str += "template_external_list_url : '/templates/templates.js'," + "\n"
    str += "content_css : '/stylesheets/customtinymce.css'," + "\n"
    str += "theme : 'advanced'," + "\n"
    str += "theme_advanced_blockformats : 'p,h1,h2,h3,h4,h5,h6'," + "\n"
    str += "theme_advanced_buttons1 : ' fullscreen,separator,bold,italic,underline,strikethrough,separator,undo,redo,separator,link,unlink,template,formatselect, code'," + "\n"
    str += "theme_advanced_buttons2 : 'cut,copy,paste,separator,pastetext,pasteword,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifiyfull,separator,removeformat,charmap'," + "\n"
    str += "theme_advanced_buttons3 : 'spellchecker,tablecontrols '," + "\n"
    str += "spellchecker_languages : '+English=en'," + "\n"
    str += "spellchecker_rpc_url : '/application/spellchecker'," + "\n"
    str += "gecko_spellcheck : 'true'," + "\n"
    str += "table_styles : 'Header 1=header1;Header 2=header2;Header 3=header3'," + "\n"
    str += "table_cell_styles : 'Header 1=header1;Header 2=header2;Header 3=header3;Table Cell=tableCel1'," + "\n"
    str += "table_row_styles : 'Header 1=header1;Header 2=header2;Header 3=header3;Table Row=tableRow1'," + "\n"
    str += "theme_advanced_resizing : 'true'," + "\n"
    str += "theme_advanced_toolbar_align : 'left'," + "\n"
    str += "theme_advanced_toolbar_location : 'top'," + "\n"
    str += "width : '415px'"  + "\n"                      
    str += "});" + "\n"
    str += "//]]>" + "\n"
    str += "</script> "
    return str 
  end
end
