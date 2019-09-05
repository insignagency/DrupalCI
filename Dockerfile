FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
# Install Git and wget.
  git \
  wget \
# Install curl and sudo privileges
  curl \
  rsync \
  sudo

RUN apt-get update && rm -rf /var/lib/apt/lists/*

# Install other dependencies
RUN apt-get update && apt-get install --fix-missing -y \
  apt-transport-https \
  apt-utils \
  dialog apt-utils \	
  cloc \
  imagemagick \
  graphviz \
  libicu-dev \
  libmemcached-tools \
  libnss3 libgconf-2-4 \
  libmemcached-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libxslt1-dev \
  libyaml-dev \
  linux-libc-dev \
  ruby-dev \
  libpng-dev \  
  rubygems \
  tree \
  vim \
  wget \
  zip

RUN docker-php-ext-install gd
# See https://www.php.net/manual/en/migration72.other-changes.php#migration72.other-changes.mcrypt
RUN pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

# Install Node 7.1.0
ENV NODE_VERSION 7.1.0
RUN curl -LO "https://nodejs.org/dist/v7.1.0/node-v7.1.0-linux-x64.tar.gz" \
&& tar -xzf node-v7.1.0-linux-x64.tar.gz -C /usr/local --strip-components=1 \
&& rm node-v7.1.0-linux-x64.tar.gz

# Install npm 4.2 via yarn 
RUN npm install -g yarn
RUN yarn
RUN mkdir -p /opt/yarn/bin && ln -s /opt/yarn/yarn-v1.5.1/bin/yarn /opt/yarn/bin/yarn
RUN yarn global add npm@4.2.0
RUN npm install --production
RUN node -v && npm -v
RUN npm run

# Install composer
ENV COMPOSER_VERSION 1.7.2
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.7.2 
RUN ln -s /usr/local/bin/composer /usr/bin/composer

#Install Drush9 via composer
ENV DRUSH_VERSION 9.0.0
RUN git clone https://github.com/drush-ops/drush.git /usr/local/src/drush && \
    cd /usr/local/src/drush && \
    git checkout ${DRUSH_VERSION} && \
    ln -s /usr/local/src/drush/drush /usr/bin/drush && \
    composer install
RUN drush --version

#Install Drupal console launcher
RUN php -r "readfile('https://drupalconsole.com/installer');" > drupal.phar && \
    mv drupal.phar /usr/local/bin/drupal && \
    chmod +x /usr/local/bin/drupal && \
    /usr/local/bin/drupal check

#Install and configure chromedriver
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
    ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver