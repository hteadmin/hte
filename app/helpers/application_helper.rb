module ApplicationHelper

  def number_to_formatted_currency(value)
    ("<span>%s</span> %s" % [number_with_delimiter(value), I18n.t('number.currency.format.unit')]).html_safe
  end

  def game_set_links(game)
    links = []
    game.instances.each do |instance|
      links << link_to(instance.name, chon_game_path(set: instance.slug))
    end
    links.join(', ').html_safe
  end
end
