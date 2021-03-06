package mokha.utils.animation;

/**
    An animation frame is a rectangular shape that is positioned
    somewhere on the sprite sheet. It's a mask that only shows
    the part of the image on the sprite sheet that overlaps with
    the rectangular animation frame shape.
**/
class AnimationFrame {
    /**
        X position on sprite sheet.
    **/
    public var x(get, null) : Float;

    /**
        Y position on sprite sheet.
    **/
    public var y(get, null) : Float;

    /**
        Width.
    **/
    public var width(get, null) : Float;

    /**
        Height.
    **/
    public var height(get, null) : Float;

    /**
        Row index in sprite sheet.
    **/
    public var row(get, null) : Int;

    /**
        Column index in sprite sheet.
    **/
    public var column(get, null) : Int;

    /**
        Creates new animation frame.
    **/
    public function new(width : Float, height : Float) : Void {
        this.width = width;
        this.height = height;

        this.x = 0;
        this.y = 0;
        this.row = 0;
        this.column = 0;
    }

    /**
        Updates animation frame position on sprite sheet.
    **/
    public function update(frameIndex : Int, totalRows : Int, totalColumns : Int) : Void {
        this.row = Std.int(frameIndex / totalColumns);
        this.column = Std.int(frameIndex - this.row * totalColumns);
        this.y = this.row * this.height;
        this.x = this.column * this.width;
    }
    
    @:noCompletion inline function get_x() return this.x;
    
    @:noCompletion inline function get_y() return this.y;
    
    @:noCompletion inline function get_width() return this.width;
    
    @:noCompletion inline function get_height() return this.height;
    
    @:noCompletion inline function get_row() return this.row;
    
    @:noCompletion inline function get_column() return this.column;
}