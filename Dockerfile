# Stage 1: builder
FROM alpine AS builder
WORKDIR /app
COPY index.html .

# Stage 2: production (small nginx image)
FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
