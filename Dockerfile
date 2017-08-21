FROM sonarqube:lts

ENV SONARQUBE_HOME=/opt/sonarqube

RUN useradd -r sonar
RUN chown -R sonar "$SONARQUBE_HOME"
RUN chgrp -R 0 "$SONARQUBE_HOME"
RUN chmod -R g+rw "$SONARQUBE_HOME"
RUN find "$SONARQUBE_HOME" -type d -exec chmod g+x {} +
RUN chmod 775 $SONARQUBE_HOME/bin/run.sh

USER sonar
WORKDIR $SONARQUBE_HOME
ENTRYPOINT ["./bin/run.sh"]