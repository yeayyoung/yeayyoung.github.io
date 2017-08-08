#!/usr/bin/env ruby
#encoding: utf-8

class String
  han = '\p{Han}|[，。？；：‘’“”、！……（）]'
  @@chinese_regex = /(#{han}) *\n *(#{han})/m
  def join_chinese!
    gsub!(@@chinese_regex, '\1\2')
  end
end

# works for Jekyll version 3
Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content.join_chinese!
end
