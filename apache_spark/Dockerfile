FROM apache/spark

USER root

RUN mkdir -p /home/spark/.vscode-server/bin && \
    chown -R spark:spark /home/spark

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

USER spark

ENV PYTHONPATH="/app"

CMD ["tail", "-f", "/dev/null"]