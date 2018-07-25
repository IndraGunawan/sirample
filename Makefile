.PHONY: all

server:
	bundle exec rackup app/web/config.ru
