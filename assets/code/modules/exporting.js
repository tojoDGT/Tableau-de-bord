/*
 Highcharts JS v7.2.0 (2019-09-03)

 Exporting module

 (c) 2010-2019 Torstein Honsi

 License: www.highcharts.com/license
*/
(function(c) {
    "object" === typeof module && module.exports ? (c["default"] = c, module.exports = c) : "function" === typeof define && define.amd ? define("highcharts/modules/exporting", ["highcharts"], function(k) {
        c(k);
        c.Highcharts = k;
        return c
    }) : c("undefined" !== typeof Highcharts ? Highcharts : void 0)
})(function(c) {
    function k(e, t, c, k) {
        e.hasOwnProperty(t) || (e[t] = k.apply(null, c))
    }
    c = c ? c._modules : {};
    k(c, "modules/full-screen.src.js", [c["parts/Globals.js"]], function(e) {
        (e.FullScreen = function(e) {
            this.init(e.parentNode)
        }).prototype = {
            init: function(e) {
                var c;
                e.requestFullscreen ? c = e.requestFullscreen() : e.mozRequestFullScreen ? c = e.mozRequestFullScreen() : e.webkitRequestFullscreen ? c = e.webkitRequestFullscreen() : e.msRequestFullscreen && (c = e.msRequestFullscreen());
                if (c) c["catch"](function() {
                    alert("Full screen is not supported inside a frame")
                })
            }
        }
    });
    k(c, "mixins/navigation.js", [], function() {
        return {
            initUpdate: function(e) {
                e.navigation || (e.navigation = {
                    updates: [],
                    update: function(e, c) {
                        this.updates.forEach(function(t) {
                            t.update.call(t.context, e,
                                c)
                        })
                    }
                })
            },
            addUpdate: function(e, c) {
                c.navigation || this.initUpdate(c);
                c.navigation.updates.push({
                    update: e,
                    context: c
                })
            }
        }
    });
    k(c, "modules/exporting.src.js", [c["parts/Globals.js"], c["parts/Utilities.js"], c["mixins/navigation.js"]], function(e, c, k) {
        var t = c.isObject,
            E = c.objectEach;
        c = e.defaultOptions;
        var A = e.doc,
            C = e.Chart,
            y = e.addEvent,
            J = e.removeEvent,
            D = e.fireEvent,
            w = e.createElement,
            F = e.discardElement,
            u = e.css,
            p = e.merge,
            q = e.pick,
            x = e.extend,
            K = e.isTouchDevice,
            z = e.win,
            H = z.navigator.userAgent,
            G = e.SVGRenderer,
            I = e.Renderer.prototype.symbols,
            L = /Edge\/|Trident\/|MSIE /.test(H),
            M = /firefox/i.test(H);
        x(c.lang, {
            viewFullscreen: "Voir en plein écran",
            printChart: "Imprimer",
            downloadPNG: "Télécharger en image PNG",
            downloadJPEG: "Télécharger en image JPEG",
            downloadPDF: "Télécharger en document PDF",
            downloadSVG: "Télécharger en vecteur image SVG",
            contextButtonTitle: "Chart context menu"
        });
        c.navigation || (c.navigation = {});
        p(!0, c.navigation, {
            buttonOptions: {
                theme: {},
                symbolSize: 14,
                symbolX: 12.5,
                symbolY: 10.5,
                align: "right",
                buttonSpacing: 3,
                height: 22,
                verticalAlign: "top",
                width: 24
            }
        });
        p(!0, c.navigation, {
            menuStyle: {
                border: "1px solid #999999",
                background: "#ffffff",
                padding: "5px 0"
            },
            menuItemStyle: {
                padding: "0.5em 1em",
                color: "#333333",
                background: "none",
                fontSize: K ? "14px" : "11px",
                transition: "background 250ms, color 250ms"
            },
            menuItemHoverStyle: {
                background: "#335cad",
                color: "#ffffff"
            },
            buttonOptions: {
                symbolFill: "#666666",
                symbolStroke: "#666666",
                symbolStrokeWidth: 3,
                theme: {
                    padding: 5
                }
            }
        });
        c.exporting = {
            type: "image/png",
            url: "https://export.highcharts.com/",
            printMaxWidth: 780,
            scale: 2,
            buttons: {
                contextButton: {
                    className: "highcharts-contextbutton",
                    menuClassName: "highcharts-contextmenu",
                    symbol: "menu",
                    titleKey: "contextButtonTitle",
                    menuItems: "viewFullscreen printChart separator downloadPNG downloadJPEG downloadPDF downloadSVG".split(" ")
                }
            },
            menuItemDefinitions: {
                viewFullscreen: {
                    textKey: "viewFullscreen",
                    onclick: function() {
                        this.fullscreen = new e.FullScreen(this.container)
                    }
                },
                printChart: {
                    textKey: "printChart",
                    onclick: function() {
                        this.print()
                    }
                },
                separator: {
                    separator: !0
                },
                downloadPNG: {
                    textKey: "downloadPNG",
                    onclick: function() {
                        this.exportChart()
                    }
                },
                downloadJPEG: {
                    textKey: "downloadJPEG",
                    onclick: function() {
                        this.exportChart({
                            type: "image/jpeg"
                        })
                    }
                },
                downloadPDF: {
                    textKey: "downloadPDF",
                    onclick: function() {
                        this.exportChart({
                            type: "application/pdf"
                        })
                    }
                },
                downloadSVG: {
                    textKey: "downloadSVG",
                    onclick: function() {
                        this.exportChart({
                            type: "image/svg+xml"
                        })
                    }
                }
            }
        };
        e.post = function(a, b, f) {
            var d = w("form", p({
                method: "post",
                action: a,
                enctype: "multipart/form-data"
            }, f), {
                display: "none"
            }, A.body);
            E(b, function(b, a) {
                w("input", {
                    type: "hidden",
                    name: a,
                    value: b
                }, null, d)
            });
            d.submit();
            F(d)
        };
        x(C.prototype, {
            sanitizeSVG: function(a,
                b) {
                var f = a.indexOf("</svg>") + 6,
                    d = a.substr(f);
                a = a.substr(0, f);
                b && b.exporting && b.exporting.allowHTML && d && (d = '<foreignObject x="0" y="0" width="' + b.chart.width + '" height="' + b.chart.height + '"><body xmlns="http://www.w3.org/1999/xhtml">' + d + "</body></foreignObject>", a = a.replace("</svg>", d + "</svg>"));
                a = a.replace(/zIndex="[^"]+"/g, "").replace(/symbolName="[^"]+"/g, "").replace(/jQuery[0-9]+="[^"]+"/g, "").replace(/url\(("|&quot;)(.*?)("|&quot;);?\)/g, "url($2)").replace(/url\([^#]+#/g, "url(#").replace(/<svg /,
                    '<svg xmlns:xlink="http://www.w3.org/1999/xlink" ').replace(/ (|NS[0-9]+:)href=/g, " xlink:href=").replace(/\n/, " ").replace(/(fill|stroke)="rgba\(([ 0-9]+,[ 0-9]+,[ 0-9]+),([ 0-9\.]+)\)"/g, '$1="rgb($2)" $1-opacity="$3"').replace(/&nbsp;/g, "\u00a0").replace(/&shy;/g, "\u00ad");
                this.ieSanitizeSVG && (a = this.ieSanitizeSVG(a));
                return a
            },
            getChartHTML: function() {
                this.styledMode && this.inlineStyles();
                return this.container.innerHTML
            },
            getSVG: function(a) {
                var b, f = p(this.options, a);
                f.plotOptions = p(this.userOptions.plotOptions,
                    a && a.plotOptions);
                var d = w("div", null, {
                    position: "absolute",
                    top: "-9999em",
                    width: this.chartWidth + "px",
                    height: this.chartHeight + "px"
                }, A.body);
                var c = this.renderTo.style.width;
                var r = this.renderTo.style.height;
                c = f.exporting.sourceWidth || f.chart.width || /px$/.test(c) && parseInt(c, 10) || (f.isGantt ? 800 : 600);
                r = f.exporting.sourceHeight || f.chart.height || /px$/.test(r) && parseInt(r, 10) || 400;
                x(f.chart, {
                    animation: !1,
                    renderTo: d,
                    forExport: !0,
                    renderer: "SVGRenderer",
                    width: c,
                    height: r
                });
                f.exporting.enabled = !1;
                delete f.data;
                f.series = [];
                this.series.forEach(function(a) {
                    b = p(a.userOptions, {
                        animation: !1,
                        enableMouseTracking: !1,
                        showCheckbox: !1,
                        visible: a.visible
                    });
                    b.isInternal || f.series.push(b)
                });
                this.axes.forEach(function(b) {
                    b.userOptions.internalKey || (b.userOptions.internalKey = e.uniqueKey())
                });
                var l = new e.Chart(f, this.callback);
                a && ["xAxis", "yAxis", "series"].forEach(function(b) {
                    var d = {};
                    a[b] && (d[b] = a[b], l.update(d))
                });
                this.axes.forEach(function(b) {
                    var a = e.find(l.axes, function(a) {
                            return a.options.internalKey === b.userOptions.internalKey
                        }),
                        d = b.getExtremes(),
                        f = d.userMin;
                    d = d.userMax;
                    a && (void 0 !== f && f !== a.min || void 0 !== d && d !== a.max) && a.setExtremes(f, d, !0, !1)
                });
                c = l.getChartHTML();
                D(this, "getSVG", {
                    chartCopy: l
                });
                c = this.sanitizeSVG(c, f);
                f = null;
                l.destroy();
                F(d);
                return c
            },
            getSVGForExport: function(a, b) {
                var f = this.options.exporting;
                return this.getSVG(p({
                    chart: {
                        borderRadius: 0
                    }
                }, f.chartOptions, b, {
                    exporting: {
                        sourceWidth: a && a.sourceWidth || f.sourceWidth,
                        sourceHeight: a && a.sourceHeight || f.sourceHeight
                    }
                }))
            },
            getFilename: function() {
                var a = this.userOptions.title &&
                    this.userOptions.title.text,
                    b = this.options.exporting.filename;
                if (b) return b;
                "string" === typeof a && (b = a.toLowerCase().replace(/<\/?[^>]+(>|$)/g, "").replace(/[\s_]+/g, "-").replace(/[^a-z0-9\-]/g, "").replace(/^[\-]+/g, "").replace(/[\-]+/g, "-").substr(0, 24).replace(/[\-]+$/g, ""));
                if (!b || 5 > b.length) b = "chart";
                return b
            },
            exportChart: function(a, b) {
                b = this.getSVGForExport(a, b);
                a = p(this.options.exporting, a);
                e.post(a.url, {
                        filename: a.filename || this.getFilename(),
                        type: a.type,
                        width: a.width || 0,
                        scale: a.scale,
                        svg: b
                    },
                    a.formAttributes)
            },
            print: function() {
                function a(a) {
                    (b.fixedDiv ? [b.fixedDiv, b.scrollingContainer] : [b.container]).forEach(function(b) {
                        a.appendChild(b)
                    })
                }
                var b = this,
                    f = [],
                    d = A.body,
                    c = d.childNodes,
                    e = b.options.exporting.printMaxWidth,
                    l;
                if (!b.isPrinting) {
                    b.isPrinting = !0;
                    b.pointer.reset(null, 0);
                    D(b, "beforePrint");
                    if (l = e && b.chartWidth > e) {
                        var g = [b.options.chart.width, void 0, !1];
                        b.setSize(e, void 0, !1)
                    }[].forEach.call(c, function(b, a) {
                        1 === b.nodeType && (f[a] = b.style.display, b.style.display = "none")
                    });
                    a(d);
                    setTimeout(function() {
                        z.focus();
                        z.print();
                        setTimeout(function() {
                            a(b.renderTo);
                            [].forEach.call(c, function(b, a) {
                                1 === b.nodeType && (b.style.display = f[a])
                            });
                            b.isPrinting = !1;
                            l && b.setSize.apply(b, g);
                            D(b, "afterPrint")
                        }, 1E3)
                    }, 1)
                }
            },
            contextMenu: function(a, b, f, d, c, r, l) {
                var g = this,
                    m = g.options.navigation,
                    p = g.chartWidth,
                    B = g.chartHeight,
                    n = "cache-" + a,
                    h = g[n],
                    v = Math.max(c, r);
                if (!h) {
                    g.exportContextMenu = g[n] = h = w("div", {
                        className: a
                    }, {
                        position: "absolute",
                        zIndex: 1E3,
                        padding: v + "px",
                        pointerEvents: "auto"
                    }, g.fixedDiv || g.container);
                    var k = w("div", {
                            className: "highcharts-menu"
                        },
                        null, h);
                    g.styledMode || u(k, x({
                        MozBoxShadow: "3px 3px 10px #888",
                        WebkitBoxShadow: "3px 3px 10px #888",
                        boxShadow: "3px 3px 10px #888"
                    }, m.menuStyle));
                    h.hideMenu = function() {
                        u(h, {
                            display: "none"
                        });
                        l && l.setState(0);
                        g.openMenu = !1;
                        u(g.renderTo, {
                            overflow: "hidden"
                        });
                        e.clearTimeout(h.hideTimer);
                        D(g, "exportMenuHidden")
                    };
                    g.exportEvents.push(y(h, "mouseleave", function() {
                        h.hideTimer = z.setTimeout(h.hideMenu, 500)
                    }), y(h, "mouseenter", function() {
                        e.clearTimeout(h.hideTimer)
                    }), y(A, "mouseup", function(b) {
                        g.pointer.inClass(b.target,
                            a) || h.hideMenu()
                    }), y(h, "click", function() {
                        g.openMenu && h.hideMenu()
                    }));
                    b.forEach(function(b) {
                        "string" === typeof b && (b = g.options.exporting.menuItemDefinitions[b]);
                        if (t(b, !0)) {
                            if (b.separator) var a = w("hr", null, null, k);
                            else a = w("div", {
                                className: "highcharts-menu-item",
                                onclick: function(a) {
                                    a && a.stopPropagation();
                                    h.hideMenu();
                                    b.onclick && b.onclick.apply(g, arguments)
                                },
                                innerHTML: b.text || g.options.lang[b.textKey]
                            }, null, k), g.styledMode || (a.onmouseover = function() {
                                u(this, m.menuItemHoverStyle)
                            }, a.onmouseout = function() {
                                u(this,
                                    m.menuItemStyle)
                            }, u(a, x({
                                cursor: "pointer"
                            }, m.menuItemStyle)));
                            g.exportDivElements.push(a)
                        }
                    });
                    g.exportDivElements.push(k, h);
                    g.exportMenuWidth = h.offsetWidth;
                    g.exportMenuHeight = h.offsetHeight
                }
                b = {
                    display: "block"
                };
                f + g.exportMenuWidth > p ? b.right = p - f - c - v + "px" : b.left = f - v + "px";
                d + r + g.exportMenuHeight > B && "top" !== l.alignOptions.verticalAlign ? b.bottom = B - d - v + "px" : b.top = d + r - v + "px";
                u(h, b);
                u(g.renderTo, {
                    overflow: ""
                });
                g.openMenu = !0
            },
            addButton: function(a) {
                var b = this,
                    f = b.renderer,
                    d = p(b.options.navigation.buttonOptions,
                        a),
                    c = d.onclick,
                    e = d.menuItems,
                    l = d.symbolSize || 12;
                b.btnCount || (b.btnCount = 0);
                b.exportDivElements || (b.exportDivElements = [], b.exportSVGElements = []);
                if (!1 !== d.enabled) {
                    var g = d.theme,
                        m = g.states,
                        k = m && m.hover;
                    m = m && m.select;
                    var B;
                    b.styledMode || (g.fill = q(g.fill, "#ffffff"), g.stroke = q(g.stroke, "none"));
                    delete g.states;
                    c ? B = function(a) {
                        a && a.stopPropagation();
                        c.call(b, a)
                    } : e && (B = function(a) {
                        a && a.stopPropagation();
                        b.contextMenu(n.menuClassName, e, n.translateX, n.translateY, n.width, n.height, n);
                        n.setState(2)
                    });
                    d.text &&
                        d.symbol ? g.paddingLeft = q(g.paddingLeft, 25) : d.text || x(g, {
                            width: d.width,
                            height: d.height,
                            padding: 0
                        });
                    b.styledMode || (g["stroke-linecap"] = "round", g.fill = q(g.fill, "#ffffff"), g.stroke = q(g.stroke, "none"));
                    var n = f.button(d.text, 0, 0, B, g, k, m).addClass(a.className).attr({
                        title: q(b.options.lang[d._titleKey || d.titleKey], "")
                    });
                    n.menuClassName = a.menuClassName || "highcharts-menu-" + b.btnCount++;
                    if (d.symbol) {
                        var h = f.symbol(d.symbol, d.symbolX - l / 2, d.symbolY - l / 2, l, l, {
                            width: l,
                            height: l
                        }).addClass("highcharts-button-symbol").attr({
                            zIndex: 1
                        }).add(n);
                        b.styledMode || h.attr({
                            stroke: d.symbolStroke,
                            fill: d.symbolFill,
                            "stroke-width": d.symbolStrokeWidth || 1
                        })
                    }
                    n.add(b.exportingGroup).align(x(d, {
                        width: n.width,
                        x: q(d.x, b.buttonOffset)
                    }), !0, "spacingBox");
                    b.buttonOffset += (n.width + d.buttonSpacing) * ("right" === d.align ? -1 : 1);
                    b.exportSVGElements.push(n, h)
                }
            },
            destroyExport: function(a) {
                var b = a ? a.target : this;
                a = b.exportSVGElements;
                var f = b.exportDivElements,
                    d = b.exportEvents,
                    c;
                a && (a.forEach(function(a, d) {
                    a && (a.onclick = a.ontouchstart = null, c = "cache-" + a.menuClassName, b[c] &&
                        delete b[c], b.exportSVGElements[d] = a.destroy())
                }), a.length = 0);
                b.exportingGroup && (b.exportingGroup.destroy(), delete b.exportingGroup);
                f && (f.forEach(function(a, d) {
                    e.clearTimeout(a.hideTimer);
                    J(a, "mouseleave");
                    b.exportDivElements[d] = a.onmouseout = a.onmouseover = a.ontouchstart = a.onclick = null;
                    F(a)
                }), f.length = 0);
                d && (d.forEach(function(a) {
                    a()
                }), d.length = 0)
            }
        });
        G.prototype.inlineToAttributes = "fill stroke strokeLinecap strokeLinejoin strokeWidth textAnchor x y".split(" ");
        G.prototype.inlineBlacklist = [/-/, /^(clipPath|cssText|d|height|width)$/,
            /^font$/, /[lL]ogical(Width|Height)$/, /perspective/, /TapHighlightColor/, /^transition/, /^length$/
        ];
        G.prototype.unstyledElements = ["clipPath", "defs", "desc"];
        C.prototype.inlineStyles = function() {
            function a(a) {
                return a.replace(/([A-Z])/g, function(a, b) {
                    return "-" + b.toLowerCase()
                })
            }

            function b(c) {
                function f(b, f) {
                    v = u = !1;
                    if (k) {
                        for (r = k.length; r-- && !u;) u = k[r].test(f);
                        v = !u
                    }
                    "transform" === f && "none" === b && (v = !0);
                    for (r = e.length; r-- && !v;) v = e[r].test(f) || "function" === typeof b;
                    v || y[f] === b && "svg" !== c.nodeName || g[c.nodeName][f] ===
                        b || (-1 !== d.indexOf(f) ? c.setAttribute(a(f), b) : h += a(f) + ":" + b + ";")
                }
                var h = "",
                    v, u, r;
                if (1 === c.nodeType && -1 === l.indexOf(c.nodeName)) {
                    var t = z.getComputedStyle(c, null);
                    var y = "svg" === c.nodeName ? {} : z.getComputedStyle(c.parentNode, null);
                    if (!g[c.nodeName]) {
                        m = q.getElementsByTagName("svg")[0];
                        var w = q.createElementNS(c.namespaceURI, c.nodeName);
                        m.appendChild(w);
                        g[c.nodeName] = p(z.getComputedStyle(w, null));
                        "text" === c.nodeName && delete g.text.fill;
                        m.removeChild(w)
                    }
                    if (M || L)
                        for (var x in t) f(t[x], x);
                    else E(t, f);
                    h && (t = c.getAttribute("style"),
                        c.setAttribute("style", (t ? t + ";" : "") + h));
                    "svg" === c.nodeName && c.setAttribute("stroke-width", "1px");
                    "text" !== c.nodeName && [].forEach.call(c.children || c.childNodes, b)
                }
            }
            var c = this.renderer,
                d = c.inlineToAttributes,
                e = c.inlineBlacklist,
                k = c.inlineWhitelist,
                l = c.unstyledElements,
                g = {},
                m;
            c = A.createElement("iframe");
            u(c, {
                width: "1px",
                height: "1px",
                visibility: "hidden"
            });
            A.body.appendChild(c);
            var q = c.contentWindow.document;
            q.open();
            q.write('<svg xmlns="http://www.w3.org/2000/svg"></svg>');
            q.close();
            b(this.container.querySelector("svg"));
            m.parentNode.removeChild(m)
        };
        I.menu = function(a, b, c, d) {
            return ["M", a, b + 2.5, "L", a + c, b + 2.5, "M", a, b + d / 2 + .5, "L", a + c, b + d / 2 + .5, "M", a, b + d - 1.5, "L", a + c, b + d - 1.5]
        };
        I.menuball = function(a, b, c, d) {
            a = [];
            d = d / 3 - 2;
            return a = a.concat(this.circle(c - d, b, d, d), this.circle(c - d, b + d + 4, d, d), this.circle(c - d, b + 2 * (d + 4), d, d))
        };
        C.prototype.renderExporting = function() {
            var a = this,
                b = a.options.exporting,
                c = b.buttons,
                d = a.isDirtyExporting || !a.exportSVGElements;
            a.buttonOffset = 0;
            a.isDirtyExporting && a.destroyExport();
            d && !1 !== b.enabled && (a.exportEvents = [], a.exportingGroup = a.exportingGroup || a.renderer.g("exporting-group").attr({
                zIndex: 3
            }).add(), E(c, function(b) {
                a.addButton(b)
            }), a.isDirtyExporting = !1);
            y(a, "destroy", a.destroyExport)
        };
        y(C, "init", function() {
            var a = this;
            a.exporting = {
                update: function(b, c) {
                    a.isDirtyExporting = !0;
                    p(!0, a.options.exporting, b);
                    q(c, !0) && a.redraw()
                }
            };
            k.addUpdate(function(b, c) {
                a.isDirtyExporting = !0;
                p(!0, a.options.navigation, b);
                q(c, !0) && a.redraw()
            }, a)
        });
        C.prototype.callbacks.push(function(a) {
            a.renderExporting();
            y(a, "redraw", a.renderExporting)
        })
    });
    k(c, "masters/modules/exporting.src.js", [], function() {})
});
//# sourceMappingURL=exporting.js.map