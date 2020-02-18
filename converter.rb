#!/usr/bin/env ruby
class Converter
  attr_accessor :contents
  attr_reader :folder_destination

  def initialize(folder_destination)
    @folder_destination = folder_destination.chomp.strip
    @contents = []
  end

  def call
    begin
      validate_path_result = validate_path(folder_destination)
      return validate_path_result[:message] unless validate_path_result[:status]

      validate_cotents_result = validate_contents(initialize_contents)
      return validate_cotents_result[:message] unless validate_cotents_result[:status]

      content_with_highest_count = sorted_contents.first

      "#{content_with_highest_count[0]} #{content_with_highest_count[1]}"
    rescue => exception
      "There are some errors : #{exception}!"
    end
  end

  private

  # Manipulate contents values
  def grouped_contents
    contents.group_by{|content| content}
  end

  def mapped_contents
    grouped_contents.map{|content, values| [content,  values.count]}.to_h
  end

  def sorted_contents
    mapped_contents.sort_by{|content, values_count| values_count}.reverse
  end

  # Initialize contents values from detected files
  def initialize_contents
    files = Dir.glob("#{cleaned_path(folder_destination)}/**/*").reject {|f| File.directory?(f)}
    @contents = files.map{|file| IO.binread(file)}
  end

  # Validate contents value
  def validate_contents(data)
    return {status: false, message: 'No files detected'} if data.empty?
    return {status: true, message: ''}
  end

  # Validate folder destination value
  def validate_path(folder_destination)
    return {status: false, message: 'Folder destination contain unsupported character'} if folder_destination =~ /[%*:<>?"]/i
    return {status: false, message: 'Folder destination does not exist'} unless File.directory?(folder_destination)
    return {status: true, message: ''}
  end

  # Ensuring folder destination value can be used
  def cleaned_path(folder_destination)
    folder_destination[-1] =~ /[\/\\]/i ? folder_destination.chop : folder_destination
  end
end