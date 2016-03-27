module EventsHelper

  def render_let_me_see_link(event)
    link_to "讓我看看", event_path(event)  ,:class => " btn btn-primary active "
  end

end
