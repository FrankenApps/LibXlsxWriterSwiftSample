//
//  LicensesPage.swift
//  LibXlsxWriterSwiftSample
//

import UIKit

class LicensesPage: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Open Source Licenses"

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(describtionLabel)
        stackView.addArrangedSubview(libxlsxwriterLabel)
        stackView.addArrangedSubview(libxlsxwriterLicense)
        stackView.addArrangedSubview(sourcefulLabel)
        stackView.addArrangedSubview(sourcefulLicense)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let describtionLabel: UITextView = {
        let textView = UITextView()
        textView.text = "This project uses the following open source components:"
        textView.font = .boldSystemFont(ofSize: 24)
        textView.isScrollEnabled = false
        return textView
    }()

    let libxlsxwriterLabel: UITextView = {
        let textView = UITextView()
        textView.text = "LibXlsxWriter licensed under:"
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isScrollEnabled = false
        return textView
    }()

    let libxlsxwriterLicense: UITextView = {
        let textView = UITextView()
        textView.text = """
        Libxlsxwriter is released under a FreeBSD license:

            Copyright 2014-2020, John McNamara <jmcnamara@cpan.org>
            All rights reserved.

            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:

            1. Redistributions of source code must retain the above copyright notice,
               this list of conditions and the following disclaimer.
            2. Redistributions in binary form must reproduce the above copyright
               notice, this list of conditions and the following disclaimer in the
               documentation and/or other materials provided with the distribution.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
            IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
            THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
            PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
            CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
            EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
            PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
            PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
            LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
            NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
            SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

            The views and conclusions contained in the software and documentation are
            those of the authors and should not be interpreted as representing
            official policies, either expressed or implied, of the FreeBSD Project.


        Libxlsxwriter includes `queue.h` and `tree.h` from FreeBSD, the `minizip`
        component of `zlib`, `tmpfileplus` and `md5` which have the following
        licenses:


        Queue.h from FreeBSD:

            Copyright (c) 1991, 1993
             The Regents of the University of California.  All rights reserved.

            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions
            are met:
            1. Redistributions of source code must retain the above copyright
               notice, this list of conditions and the following disclaimer.
            2. Redistributions in binary form must reproduce the above copyright
               notice, this list of conditions and the following disclaimer in the
               documentation and/or other materials provided with the distribution.
            4. Neither the name of the University nor the names of its contributors
               may be used to endorse or promote products derived from this software
               without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
            ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
            IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
            ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
            FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
            DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
            OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
            HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
            LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
            OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
            SUCH DAMAGE.


        Tree.h from FreeBSD:

            Copyright 2002 Niels Provos <provos@citi.umich.edu>
            All rights reserved.

            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions
            are met:
            1. Redistributions of source code must retain the above copyright
               notice, this list of conditions and the following disclaimer.
            2. Redistributions in binary form must reproduce the above copyright
               notice, this list of conditions and the following disclaimer in the
               documentation and/or other materials provided with the distribution.

            THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
            IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
            OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
            IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
            INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
            NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
            DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
            THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
            (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
            THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


        The `minizip` files used in the libxlsxwriter source tree are taken from the
        `zlib` ` contrib/minizip` directory. [Zlib](http://www.zlib.net) has the
        following License/Copyright:

            (C) 1995-2013 Jean-loup Gailly and Mark Adler

            This software is provided 'as-is', without any express or implied
            warranty.  In no event will the authors be held liable for any damages
            arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose,
            including commercial applications, and to alter it and redistribute it
            freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not
               claim that you wrote the original software. If you use this software
               in a product, an acknowledgment in the product documentation would be
               appreciated but is not required.
            2. Altered source versions must be plainly marked as such, and must not be
               misrepresented as being the original software.
            3. This notice may not be removed or altered from any source distribution.

            Jean-loup Gailly        Mark Adler
            jloup@gzip.org          madler@alumni.caltech.edu

        The `minizip` files have the following additional copyright declarations:

            Copyright (C) 1998-2010 Gilles Vollant
            (minizip) ( http://www.winimage.com/zLibDll/minizip.html )

            Modifications for Zip64 support
            Copyright (C) 2009-2010 Mathias Svensson ( http://result42.com )

        Note, it is possible to compile libxlsxwriter without statically linking the
        `minizip` files and instead dynamically linking to `lminizip`, see
        @ref gsg_minizip.

        [Tmpfileplus](http://www.di-mgt.com.au/c_function_to_create_temp_file.html)
        has the following license:

             This Source Code Form is subject to the terms of the Mozilla Public
             License, v. 2.0. If a copy of the MPL was not distributed with this
             file, You can obtain one at http://mozilla.org/MPL/2.0/.

             Copyright (c) 2012-16 David Ireland, DI Management Services Pty Ltd
             <http://www.di-mgt.com.au/contact/>.

        See the [Mozilla Public License, v. 2.0](http://mozilla.org/MPL/2.0/).

        Note, it is possible to compile libxlsxwriter using the standard library
        `tmpfile()` function instead of `tmpfileplus`, see @ref gsg_tmpdir.

        [Openwall MD5](https://openwall.info/wiki/people/solar/software/public-domain-source-code/md5)
        has the following licence:

            This software was written by Alexander Peslyak in 2001.  No copyright is
            claimed, and the software is hereby placed in the public domain.
            In case this attempt to disclaim copyright and place the software in the
            public domain is deemed null and void, then the software is
            Copyright (c) 2001 Alexander Peslyak and it is hereby released to the
            general public under the following terms:

            Redistribution and use in source and binary forms, with or without
            modification, are permitted.

            There's ABSOLUTELY NO WARRANTY, express or implied.

            (This is a heavily cut-down "BSD license".)

        Note, the MD5 library is used to avoid including duplicate image files in the
        xlsx file. If this functionality isn't required it is possible to compile
        libxlsxwriter without this library by passing `USE_NO_MD5=1` to make.
        """
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let sourcefulLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Sourceful licensed under:"
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let sourcefulLicense: UITextView = {
        let textView = UITextView()
        textView.text = """
        MIT License

        Copyright (c) 2019 Louis D'hauwe, Paul Hudson

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
        """
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewWillAppear(_ animated: Bool) {

    }
}
