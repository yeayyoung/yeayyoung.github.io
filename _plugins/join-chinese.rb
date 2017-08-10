#!/usr/bin/env ruby
#encoding: utf-8

class String
  han = '\p{Han}|[，。？；：‘’“”、！……（）]'
  dash = '[——“”]'
  @@chinese_regex = /(#{han}) *\n *(#{han})/m
  @@chinese_punc_regex = /(#{dash})/m
  def join_chinese!
    gsub!(@@chinese_regex, '\1\2')
  end
  def set_font!
    gsub!(@@chinese_punc_regex, '<span class="zh_punc">\1</span>')
  end
end

# works for Jekyll version 3
Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content.join_chinese!
  post.content.set_font!
end
