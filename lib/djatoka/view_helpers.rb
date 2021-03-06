module Djatoka

  # = Djatoka view helpers
  #
  # These methods accept an rft_id (identifier) that a Djatoka resolver knows
  # about and params. Params can include both parameters for a Djatoka query
  # and params for image_tag. All parameters will be passed on to image_tag allowing
  # setting of attributes like the <tt>class</tt>.
  # The resolver can either be set in
  # config/initializers/djatoka.rb of a Rails application or by setting a
  # <tt>:resolver</tt> parameter when using one of these helpers.
  module ViewHelpers

    # Returns an image_tag. Unless params are passed in which constrain the
    # <tt>scale</tt> or <tt>level</tt> of the image, this will be the highest
    # resolution of the given image.
    #   djatoka_image_tag('info:lanl-repo/ds/5aa182c2-c092-4596-af6e-e95d2e263de3',
    #     {:scale => 150, :class => 'djatoka_image'})
    #
    #   djatoka_image_tag('info:lanl-repo/ds/5aa182c2-c092-4596-af6e-e95d2e263de3',
    #      {:scale => 150, :region => [1400,500,1400,1500], :class => 'volleyball'})
    def djatoka_image_tag(rft_id, params={})
      resolver, region = setup_djatoka_image_tag(rft_id, params)
      if resolver and region
        image_tag region.url, params
      else

      end
    end

    # Returns an image_tag for a square image. The long side is cropped.
    # This can be combined with <tt>scale</tt> to determine the dimensions.
    # The correct level is attempted to be determined by Djatoka::Common#square_params.
    #   djatoka_square_image_tag('info:lanl-repo/ds/5aa182c2-c092-4596-af6e-e95d2e263de3',
    #      {:scale => 250, :class => 'djatoka_image_larger',
    #      :resolver => 'http://african.lanl.gov/adore-djatoka/resolver' })
    def djatoka_square_image_tag(rft_id, params={})
      resolver, region = setup_djatoka_image_tag(rft_id, params)
      if resolver and region
        image_tag(region.square.url, params) #+ debug(region)
      else

      end
    end

    # FIXME DRY
    def djatoka_top_left_square_image_tag(rft_id, params={})
      resolver, region = setup_djatoka_image_tag(rft_id, params)
      if resolver and region
        image_tag(region.top_left_square.url, params) #+ debug(region)
      else

      end
    end

    def djatoka_bottom_right_square_image_tag(rft_id, params={})
      resolver, region = setup_djatoka_image_tag(rft_id, params)
      if resolver and region
        image_tag(region.bottom_right_square.url, params) #+ debug(region)
      else

      end
    end

    # Returns an image tag for an image exactly 75x75
    #   djatoka_smallbox_image_tag('info:lanl-repo/ds/5aa182c2-c092-4596-af6e-e95d2e263de3')
    def djatoka_smallbox_image_tag(rft_id, params={})
      resolver, region = setup_djatoka_image_tag(rft_id, params)
      if resolver and region
        image_tag region.smallbox.url, params
      else

      end
    end

    # Include djatoka_openlayers_script on any page you need pan and zoom to
    # include the scripts OpenLayers, OpenURL and djatoka. Including those scripts
    # is required for #djatoka_init_openlayers to work.
    def djatoka_openlayers_script
      jquery = '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>'
      jquery + javascript_include_tag('OpenLayers','OpenURL', 'djatoka')
    end

    # View helper to include a bit of jQuery on the page which waits for document
    # load and then initializes the Ajax, OpenLayers viewer. Since this works
    # via Ajax, Djatoka will need to be running or proxied at the same domain as
    # the application to avoid cross-domain restrictions.
    def djatoka_init_openlayers(rft_id, div_identifier, params={})
      resolver = determine_resolver(params)
      metadata_url = resolver.metadata_url(rft_id)
      %Q|<script type="text/javascript">
          jQuery(document).ready(function() {openlayersInit('http://#{resolver.host}',
          '#{metadata_url}',
          '#{rft_id}', '#{div_identifier}');
          });
        </script>
      |
    end

    private

    def setup_djatoka_image_tag(rft_id, params)
      resolver = determine_resolver(params)
      if resolver
        region = Djatoka::Region.new(resolver, rft_id, params)
        return resolver, region
      else
      end
    end

    # Uses the <tt>:resolver</tt> parameter first and then the value stored in
    # Djatoka.resolver second.
    def determine_resolver(params)
      if params[:resolver]
        Djatoka::Resolver.new(params[:resolver])
      elsif Djatoka.resolver
        Djatoka.resolver
      else
        nil
      end
    end

  end
end

