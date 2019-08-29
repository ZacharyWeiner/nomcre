xml.instruct! :xml, version: '1.0'
  xml.rss version: '2.0' do
    xml.channel do
      xml.title 'Nomcre Video Feed'
      xml.description 'Videos to be produced by feed'
      xml.link feed_items_path(format: :rss)

      @feed_items.each do |item|
        xml.item do
          xml.title item.title
          xml.desciption item.description
          xml.body item.body
        end
      end
    end
  end

