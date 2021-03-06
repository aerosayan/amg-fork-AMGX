/* Copyright (c) 2011-2017, NVIDIA CORPORATION. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of NVIDIA CORPORATION nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "unit_test.h"

namespace amgx
{
// parameter is used as test name
DECLARE_UNITTEST_BEGIN(TemplateConfigTest);
void run()
{
    {typedef typename TConfig::template setMemSpace<AMGX_host>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::memSpace == AMGX_host);}
    {typedef typename TConfig::template setMemSpace<AMGX_device>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::memSpace == AMGX_device);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecInt>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecInt);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecUSInt>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecUSInt);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecUInt>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecUInt);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecUInt64>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecUInt64);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecBool>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecBool);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecDouble>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecDouble);}
    {typedef typename TConfig::template setVecPrec<AMGX_vecFloat>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::vecPrec == AMGX_vecFloat);}
    {typedef typename TConfig::template setMatPrec<AMGX_matFloat>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::matPrec == AMGX_matFloat);}
    {typedef typename TConfig::template setMatPrec<AMGX_matDouble>::Type TConf; UNITTEST_ASSERT_TRUE(TConf::matPrec == AMGX_matDouble);}
    {typedef typename TemplateMode<AMGX_SET_MODE_VAL(AMGX_VecPrecision, TConfig::mode, AMGX_GET_MODE_VAL(AMGX_MatPrecision, TConfig::mode))>::Type TConf; UNITTEST_ASSERT_TRUE((int)TConf::vecPrec == (int)TConfig::matPrec);}
}
DECLARE_UNITTEST_END(TemplateConfigTest);

#define AMGX_CASE_LINE(CASE) TemplateConfigTest <TemplateMode<CASE>::Type>  TemplateConfigTest_##CASE;
AMGX_FORALL_BUILDS(AMGX_CASE_LINE)
#undef AMGX_CASE_LINE

} //namespace amgx
