# ruby-version
FROM ruby:2.6.5

# Linuxコマンドの定義
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  libpq-dev \
  nodejs

# 作業ディレクトリの作成
RUN mkdir /pictgram

##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /pictgram
WORKDIR $APP_ROOT

# ローカルのGemfileをコピー
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN gem install bundler && bundle install
COPY . $APP_ROOT
