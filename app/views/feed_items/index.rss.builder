xml.instruct! :xml, version: '1.0'
  xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
    xml.channel do
      xml.title 'Nomcre Video Feed'
      xml.description 'Videos to be produced by feed'
      xml.link "https://www.nomcre.com#{feed_items_path(format: :rss)}"
      xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => "https://www.nomcre.com#{feed_items_path(format: :rss)}"

      @feed_items.each do |item|
        xml.item do
          xml.title item.title
          xml.link "https://www.nomcre.com#{feed_item_path(item)}"
          xml.category item.description
          xml.description item.body
          xml.guid item.id.to_s + item.created_at.to_s
        end
      end
    end
  end

