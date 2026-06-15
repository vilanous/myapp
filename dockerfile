FROM alpine:latest AS fetcher
RUN apk add --no-cache curl


RUN curl -fSL "https://githubusercontent.com" \
    -o /tmp/index.html

FROM nginx:alpine
COPY --fromfetcher /tmp/index.html /user/share/nginx/html/index.html
EXPOSE 80


