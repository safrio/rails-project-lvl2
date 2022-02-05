# frozen_string_literal: true

module ApplicationHelper
  def nav_menu_item(name, path = '#', options = {})
    assembled_options = options.merge(class: "nav-link link-dark #{active?(path)}")
    tag.li class: 'nav-item' do
      link_to path, assembled_options do
        tag.div(name)
      end
    end
  end

  def active?(path, options = {})
    # raise options.inspect
    if options.key? :active_if
      'active' if options[:active_if]
    elsif current_page?(path)
      'active'
    end
  end

  def shift_comment(comment, depth)
    return comment if depth <= 0

    shift_comment(content_tag(:ul, comment), depth - 1)
  end

  def render_comments(comments)
    comments.each do |parent, children|
      comment = render(partial: 'web/posts/comment_form', locals: { comment: parent })
      concat(shift_comment(comment, parent.depth))

      render_comments(children) if children.present?
    end
  end
end
