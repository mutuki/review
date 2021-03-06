# encoding: utf-8
# = resource.rb -- Message resources for EPUBMaker.
#
# Copyright (c) 2010 Kenshi Muto
#
# This program is free software.
# You can distribute or modify this program under the terms of
# the GNU LGPL, Lesser General Public License version 2.1.
# For details of the GNU LGPL, see the file "COPYING".
#

module EPUBMaker

# EPUBMaker::Resource contains message translation resources for EPUBMaker.
  class Resource
    # Construct message resource object with using +params+["language"] value.
    def initialize(params)
      @hash = nil
      begin
        @hash = __send__ params["language"]
      rescue
        @hash = __send__ :en
      end
      
      @hash.each_pair do |k, v|
        @hash[k] = params[k] unless params[k].nil?
      end
    end
    
    # Return message translation for +key+.
    def v(key)
      return @hash[key]
    end
    
    private
    # English messages.
    def en
      {
        "toctitle" => "Table of Contents",
        "covertitle" => "Cover",
        "titlepagetitle" => "Title Page",
        "colophontitle" => "Colophon",
        "c-aut" => "Author",
        "c-dsr" => "Designer",
        "c-ill" => "Illustrator",
        "c-edt" => "Editor",
        "c-prt" => "Publisher",
      }
    end
    
    # Japanese messages.
    def ja
      {
        "toctitle" => "目次",
        "covertitle" => "表紙",
        "titlepagetitle" => "権利表記",
        "colophontitle" => "奥付",
        "c-aut" => "著　者",
        "c-dsr" => "デザイン",
        "c-ill" => "イラスト",
        "c-edt" => "編　集",
        "c-prt" => "発行所",
      }
    end
  end
end
