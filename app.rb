require 'rubygems'
require 'sinatra/base'
require 'redis'
require 'json'
require 'will_paginate'
require 'will_paginate/array'

class App < Sinatra::Base
    include WillPaginate::Sinatra::Helpers

    LIVE_LOL_KEY = "live:lol:key"
    LIVE_LUSHI_KEY = "live:lushi:key"
    LIVE_CF_KEY = "live:cf:key"
    LIVE_SHOUWANG_KEY = "live:shouwang:key"
    LIVE_WANGZHE_KEY = "live:wangzhe:key"
    LIVE_DOTA2_KEY = "live:dota2:key"
    LIVE_CSGO_KEY = "live:csgo:key"
    LIVE_ZJGAME_KEY = "live:zjgame:key"

    PAGE_SIZE = 48
    $redis = Redis.new

    configure :production do
        get '/' do
            @lives = $redis.zrevrange(LIVE_LOL_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/zjgame' do
            @lives = $redis.zrevrange(LIVE_ZJGAME_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/cf' do
            @lives = $redis.zrevrange(LIVE_CF_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/hearthstone' do
            @lives = $redis.zrevrange(LIVE_LUSHI_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/overwatch' do
            @lives = $redis.zrevrange(LIVE_SHOUWANG_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/kingglory' do
            @lives = $redis.zrevrange(LIVE_WANGZHE_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/DOTA2' do
            @lives = $redis.zrevrange(LIVE_DOTA2_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        get '/csgo' do
            @lives = $redis.zrevrange(LIVE_CSGO_KEY, 0, -1, :with_scores => true)
                        .paginate(page: params[:page] || 1, per_page: PAGE_SIZE)
            erb :index, :layout => :'layout'
        end

        helpers do
            def convert_num(num)
                suffix = ""
                if num > 10_000
                    num = (num / 10_000).round(2)
                    suffix = "万"
                else
                    num = num.to_i
                end
                "#{num}#{suffix}"
            end
        end
    end
end
