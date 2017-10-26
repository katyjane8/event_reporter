require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test
  def test_printer_exists
    printer = Printer.new

    assert_instance_of Printer, printer
  end

  # def test_printing_header_prints_header
  #   printer = Printer.new
  #   result = ['LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
  #
  #   assert_equal result, printer.printing_header
  # end

  # def test_format_queue_prints_help_statement_with_empty_queue
  #   printer = Printer.new
  #
  #   assert_equal "Please enter criteria in queue", printer.printing_queue
  # end

  # def test_printer
  #   printer = Printer.new
  #
  #   assert_equal "", printer.format_queue
  # end
end
