FROM ruby:2.6.3

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget

# install nodejs(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs
# RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
# npm && npm install n -g && n <VERSION>

# 公式のインストール方法を参考に安定版で最新のyarnをインストールする
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

COPY . /homeiot/
WORKDIR /homeiot

RUN gem install bundler && bundle install && node -v

RUN yarn install && bundle exec rails webpacker:install:vue RAILS_ENV=production && bundle exec rails webpacker:compile RAILS_ENV=production
