package mokha;

import mokha.utils.transformation.Transformer;

import kha.graphics2.Graphics;

/**
    An object contains the bare minimum of methods and properties
    required to partake in the Mokha game life cycle.
**/
class Object {
    /**
        If `true`, object is updated. Default is `true`.
    **/
    public var isActive : Bool;
    
    /**
        If `true`, object is drawn. Default is `true`.
    **/
    public var isVisible : Bool;

    /**
        Read-only. If `true`, object is active and visible. 
    **/
    public var isAlive(get, null) : Bool;

    /**
        Handles transformations made to this object.
    **/
    public var transformer : Transformer;
    
    /**
        Creates a new active and visible object.
    **/
    public function new() : Void {
        isActive = true;
        isVisible = true;
        
        transformer = new Transformer();
    }
    
    /**
        Override this. Intended for collision logic.
    **/
    public function update() : Void {}

    /**
        Override this. Intended for drawing to framebuffer.
        @param  g  G2 API access to framebuffer
    **/
    public function draw(g : Graphics) : Void {}
    
    /**
        Override this. Intended for nulling references to objects.
    **/
    public function destroy() : Void {
        transformer.destroy();

        transformer = null;
    }
    
    /**
        Makes the object inactive and invisible.
    **/
    public function kill() : Void {
        isActive = false;
        isVisible = false;
    }
    
    /**
        Makes the object active and visible.
    **/
    public function revive() : Void {
        isActive = true;
        isVisible = true;
    }

    @:noCompletion inline function get_isAlive() return isActive && isVisible;
}
