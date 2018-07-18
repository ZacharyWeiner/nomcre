# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.nomcre.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end


  add faq_path
  add pricing_path
  add explainer_path
  add tos_path
  add nomcre_about_path
  add nomcre_contact_path
  add video_showcase_path
  add creative_showcase_path
  add creative_landing_path
  add nomcre_process_path
  Page.find_each do |page|
    add page_path(page)
  end

  Collection.find_each do |collection|
    add collection_path(collection)
  end
end
