package mokha.shapes;

/**
    Rectangle shape with collision logic.
**/
class Rectangle {
    /**
        Rectangle x position.
    **/
    public var x : Float;

    /**
        Rectangle y position.
    **/
    public var y : Float;

    /**
        Rectangle width.
    **/
    public var width : Float;

    /**
        Rectangle height.
    **/
    public var height : Float;

    /**
        Centroid X position.
    **/
    public var centroidX(get, null) : Float;

    /**
        Centroid Y position.
    **/
    public var centroidY(get, null) : Float;
    
    /**
        Creates new rectangle.
        @param  x       Horizontal position (top left corner)
        @param  y       Vertical position (top left corner)
        @param  width   Rectangle width
        @param  height  Rectangle height
    **/
    public function new(x : Float, y : Float, width : Float, height : Float) : Void {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    /**
        Shorthand for position setting.
    **/
    public function setPosition(x : Float, y : Float) : Void {
        this.x = x;
        this.y = y;
    }

    /**
        Shorthand for size setting.
    **/
    public function setSize(width : Float, height : Float) : Void {
        this.width = width;
        this.height = height;
    }

    /**
        Shorthand for centroid setting.
    **/
    public function setCentroid(x : Float, y : Float) : Void {
        this.x = x - width / 2;
        this.y = y - height / 2;
    }
    
    /**
        Checks if rectangle area contains point.
        @param  x   Point horizontal position
        @param  y   Point vertical position
        @return `true` if point is within rectangle
    **/
    public function containsPoint(x : Float, y : Float) : Bool {
        if (this.x > x) return false;
        if (this.y > y) return false;
        if ((this.x + width) < x) return false;
        if ((this.y + width) < y) return false;
        return true;
    }

    /**
        Checks if rectangle area contains another rectangle.
        @param  r   Object rectangle
        @return `true` if object rectangle is completely contained within subject
    **/
    public function containsRectangle(r : Rectangle) : Bool {
        if ((x + width) < (r.x + r.width)) return false;
        if (x > r.x) return false;
        if ((y + height) < (r.y + r.height)) return false;
        if (y > r.y) return false;
        return true;
    }
    
    /**
        Checks if rectangle area overlaps another rectangle.
        @param  r   Object rectangle
        @return `true` if object rectangle is completely or partially overlapping subject
    **/
    public function overlapsRectangle(r : Rectangle) : Bool {
        if (x > (r.x + r.width)) return false;
        if (y > (r.y + r.height)) return false;
        if ((x + width) < r.x) return false;
        if ((y + width) < r.y) return false;
        return true;
    }

    /**
        Gets X position of centroid.
        @return X position of centroid
    **/
    inline function get_centroidX() : Float {
        return x + width / 2;
    }

    /**
        Gets Y position of centroid.
        @return Y position of centroid
    **/
    inline function get_centroidY() : Float {
        return y + height / 2;
    }
}
