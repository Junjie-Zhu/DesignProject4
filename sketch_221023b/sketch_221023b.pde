/*
 IMPORTANT PARAMETER: layerType
 Image type in horizon planes, 3, 6, 8, 12 is feasible
 You can define your own image type in function "initiateVertex" in class "HorizonPlane"
*/
int layerType=8; 

HorizonPlane[] planes;
HorizonPlane[] outerPlanes;
int layerNum=100;
int layerHeight=10;
int layerWidth=320;
int deltaWidth=100;
float rotateRange=PI / 2;
int r=255, g=200, b=50;

void setup() {
    size(1000, 1000, P3D);
    translate(500, 500);
    noStroke();

    surface.setLocation(50, 50);
    UI();
    setPlanes();
    linkPlanes(planes);
    linkPlanes(outerPlanes);
    linkOuter();
}

void setPlanes() {
    planes = new HorizonPlane[layerNum];
    int k=0;
    while (k < layerNum) {
        planes[k] = new HorizonPlane(k * rotateRange / layerNum, layerWidth - deltaWidth * sin(PI * k / layerNum + PI / 12), layerHeight * k, layerType);
        planes[k].initiateVertex();
        k += 1;
    }
    int[] ck={r / layerNum, g / layerNum, b / layerNum};
    planes[0].linkVertex(ck);

    outerPlanes = new HorizonPlane[layerNum];
    k = 0;
    while (k < layerNum) {
        outerPlanes[k] = new HorizonPlane(k * rotateRange / layerNum, 20 + layerWidth - deltaWidth * sin(PI * k / layerNum + PI / 12), layerHeight * (k-1), layerType);
        outerPlanes[k].initiateVertex();
        k += 1;
    }
    int[] outerCk={r / layerNum, g / layerNum, b / layerNum};
    outerPlanes[0].linkVertex(ck);
}

void linkPlanes(HorizonPlane[] p) {
    int m=0;
    while (m < layerNum - 1) {
        int n=0;
        fill(r / layerNum * (m + 1), g / layerNum * (m + 1), b / layerNum * (m + 1));
        beginShape(QUAD_STRIP);
        while (n < p[0].vertexes.length) {
            vertex(p[m].vertexes[n].x, p[m].vertexes[n].y, p[m].vertexes[n].z);
            vertex(p[m + 1].vertexes[n].x, p[m + 1].vertexes[n].y, p[m + 1].vertexes[n].z);
            n += 1;
        }            
        endShape();

        beginShape();
        vertex(p[m].vertexes[0].x, p[m].vertexes[0].y, p[m].vertexes[0].z);
        vertex(p[m + 1].vertexes[0].x, p[m + 1].vertexes[0].y, p[m + 1].vertexes[0].z);
        vertex(p[m + 1].vertexes[n - 1].x, p[m + 1].vertexes[n - 1].y, p[m + 1].vertexes[n - 1].z);
        vertex(p[m].vertexes[n - 1].x, p[m].vertexes[n - 1].y, p[m].vertexes[n - 1].z);
        endShape();
        m += 1;
    }
}

void linkOuter() {
    beginShape(QUAD_STRIP);
    int l=0;
    while (l < planes[0].vertexes.length) {
        vertex(planes[layerNum-1].vertexes[l].x, planes[layerNum-1].vertexes[l].y, planes[layerNum-1].vertexes[l].z);
        vertex(outerPlanes[layerNum-1].vertexes[l].x, outerPlanes[layerNum-1].vertexes[l].y, outerPlanes[layerNum-1].vertexes[l].z);
        l += 1;
    }
    endShape();

    beginShape();
    vertex(planes[layerNum-1].vertexes[0].x, planes[layerNum-1].vertexes[0].y, planes[layerNum-1].vertexes[0].z);
    vertex(outerPlanes[layerNum-1].vertexes[0].x, outerPlanes[layerNum-1].vertexes[0].y, outerPlanes[layerNum-1].vertexes[0].z);
    vertex(outerPlanes[layerNum-1].vertexes[l - 1].x, outerPlanes[layerNum-1].vertexes[l - 1].y, outerPlanes[layerNum-1].vertexes[l - 1].z);
    vertex(planes[layerNum-1].vertexes[l - 1].x, planes[layerNum-1].vertexes[l - 1].y, planes[layerNum-1].vertexes[l - 1].z);
    endShape();
}

void draw() {
    lights();

    background(102);
    setPlanes();
    linkPlanes(planes);
    linkPlanes(outerPlanes);
    linkOuter();

    cam.beginHUD();
    slider.draw();
    cam.endHUD();

    if ((mouseX<360 && mouseY< 260) || (mouseX<150 && mouseY > height-150)) {//此限定区域为滑块所在位置
        cam.setActive(false);
    } else {
        cam.setActive(true);
    }
}
