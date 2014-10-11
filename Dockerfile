FROM shippableimages/ubuntu1404_base:0.0.1

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl

# See: http://rvm.io/support/faq#i-want-to-install-for-root-only
RUN echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
RUN echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc
RUN \curl -sSL https://get.rvm.io | bash -s stable

# We are not i a login shell, so paths are not set (alternatively, we can invoke /bin/bash -l -c ...)
RUN /root/.rvm/bin/rvm install ruby-head
RUN /root/.rvm/bin/rvm install 1.8.7
RUN /root/.rvm/bin/rvm install 1.9.2
RUN /root/.rvm/bin/rvm install 1.9.3 && /root/.rvm/bin/rvm alias create default 1.9.3
RUN /root/.rvm/bin/rvm install 2.0.0
RUN /root/.rvm/bin/rvm install 2.1.1
RUN /root/.rvm/bin/rvm install jruby

CMD ["/bin/bash"]
