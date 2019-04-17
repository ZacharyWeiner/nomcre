
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
  SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
                                                                    aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY'),
                                                                    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
                                                                    fog_directory: 'nomcre-rails',
                                                                    fog_region: ENV.fetch('AWS_REGION'))

  SitemapGenerator::Sitemap.public_path = 'tmp/'

  SitemapGenerator::Sitemap.sitemaps_host = "https://s3-us-west-2.amazonaws.com/nomcre-rails/sitemaps/"
  SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
  SitemapGenerator::Sitemap.ping_search_engines('http://www.nomcre.com/sitemap')

  add faq_path
  add pricing_path
  add explainer_path
  add tos_path
  add nomcre_about_path
  add nomcre_contact_path
  add video_showcase_path
  add model_showcase_path
  add creative_showcase_path
  add creative_landing_path
  add nomcre_process_path
  add package_types_path
  Page.where(status: 'published').each do |page|
    add page_path(page)
  end

  Collection.find_each do |collection|
    add collection_path(collection)
  end

  PackageType.find_each do |package_type|
    add package_type_slug_path(package_type.slug)
  end
end
