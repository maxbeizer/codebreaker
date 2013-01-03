require "spec_helper"

module Codebreaker
  describe Marker do
    describe "#exact_match_count" do
      context "with no other matches" do
        it "returns 0" do
          marker = Marker.new('1234', '5555')
          marker.exact_match_count.should == 0
        end
      end

      context "with one exact match" do
        it "returns 1" do
          marker = Marker.new('1234', '1555')
          marker.exact_match_count.should == 1
        end
      end

      context "with one numebr match" do
        it "returns 0" do
          marker = Marker.new('1234', '2555')
          marker.exact_match_count.should == 0
        end
      end

      context "with one exact mathc and one numebr match" do
        it "returns 1" do
          marker = Marker.new('1234', '1525')
          marker.exact_match_count.should == 1
        end
      end
    end

    describe "#number_match_count" do
      context "with one exact match duplicated in guess" do
        it "returns 0" do
          marker = Marker.new('1234', '1155')
          marker.number_match_count.should == 0
        end
      end

      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('1234', '5555')
          marker.number_match_count.should == 0
        end
      end

      context "with one number match" do
        it "returns 1" do
          marker = Marker.new('1234', '2555')
          marker.number_match_count.should == 1
        end
      end

      context "with one exact match" do
        it "returns 0" do
          marker = Marker.new('1234', '1555')
          marker.number_match_count.should == 0
        end
      end

      context "with one exact match and one nummber match" do
        it "returns 1" do
          marker = Marker.new('1234', '1525')
          marker.number_match_count.should == 1
        end
      end
    end
  end
end
