pointInRect(point, rect) {
    if (point.x >= rect.minX &&
        point.x < rect.maxX &&
        point.y >= rect.minY &&
        point.y < rect.maxY
    ) {
        return true
    }

    return false
}
