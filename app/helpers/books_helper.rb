module BooksHelper
  include ActsAsTaggableOn::TagsHelper
  ActsAsTaggableOn.remove_unused_tags = true
  ActsAsTaggableOn.force_lowercase = true
  ActsAsTaggableOn.force_parameterize = false
end
