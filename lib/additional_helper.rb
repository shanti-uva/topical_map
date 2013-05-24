module AdditionalHelper    
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
    opts[:html] ? 'SHANTI UVa Topical Map' : 'SHANTI UVa Topical Map' 
  end

  def banner_title(opts={:html=>true})
    opts[:html] ? 'SHANTI - Topical Map' : 'SHANTI - Topical Map'
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
    return "<div id=\"login-status\">#{login_status}#{'&nbsp;'*3}#{language_option_links}</div>\n".html_safe
  end
  
  # this method relies on the authenticated_system plugin
  def login_status
    if !logged_in?
      return link_to 'Login', authenticated_system_login_path
    else
      s = "#{current_user.login}"
      if self.current_user.shibboleth_id.blank?
        s << " (#{link_to 'Associate to UVa account', shibboleth_url(:protocol => 'https')}) | "
      else
        s << ' | '
      end
      s << "#{link_to('Logout', authenticated_system_logout_path)} | "
      s << "#{link_to 'Admin', authenticated_system_root_path} | " if authorized? hash_for_authenticated_system_root_path
      s
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
    str += "content_css : '#{asset_path('customtinymce.css')}'," + "\n"
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
    return str.html_safe
  end
end
