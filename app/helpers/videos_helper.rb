module VideosHelper
  def video_tags_for(video)
    tag_cloud = video.tags&.split(", ") || []
    tag_cloud.map { |tag|
      content_tag :span, tag,
                  class: "m-1 inline-flex items-center gap-x-1.5 rounded-full bg-gray-200 px-1.5 py-0.5 text-xs font-medium text-gray-600"
    }.join("").html_safe
  end
end
