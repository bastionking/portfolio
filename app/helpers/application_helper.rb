module ApplicationHelper
  def login_helper(style= '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)

    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(styles)
   if session[:source]
          greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{ link_to 'contact me', contact_path } if you'd like to work together."
          content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: tech_news_path,
        title: 'Tech News'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: infos_path,
        title: 'Info'
      }
    ]
  end

  def copyright_generator
   DevcampViewTool::Renderer.copyright 'David Jian', 'All rights reserved'
  end

  def nav_helper(style, tag_type)
    nav_links = ''

    nav_items.each do |item|
    nav_links <<  "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:notice] || flash[:error])

    if alert
      alert_generator(alert)
    end
  end

  def alert_generator(msg)
    js add_gritter(msg, title: "David Jian Portfolio", sticky: false, time: 3000)
  end

end
