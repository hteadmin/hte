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

  def ps4_games
    [
      {name: "ASSASSIN'S CREED IV: BLACK FLAG", trailer: "http://www.youtube.com/watch?v=fzIwI6O03LI"},
      {name: "TOMB RAIDER: DEFINITIVE EDITION", trailer: "http://www.youtube.com/watch?v=cM03TEakgcg"},
      {name: "FINAL FANTASY® XIV: A REALM REBORN™", trailer: "http://www.youtube.com/watch?v=moOVWP7hVuU"},
      {name: "NEED FOR SPEED: RIVALS", trailer: "http://www.youtube.com/watch?v=xsKHweFi7AU"},
      {name: "CALL OF DUTY®: GHOSTS", trailer: "http://www.youtube.com/watch?v=uRlTQinySVw"},
      {name: "INFAMOUS: SECOND SON", trailer: "http://www.youtube.com/watch?v=OaqN7aBVXcE"},
      {name: "FIFA 14", trailer: "http://www.youtube.com/watch?v=5HhL8eXSy7A"}
    ]
  end
end
